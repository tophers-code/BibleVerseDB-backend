require 'net/http'
require 'json'

class BibleApiService
  WLDEH_BASE_URL = 'https://cdn.jsdelivr.net/gh/wldeh/bible-api/bibles'.freeze
  ESV_BASE_URL = 'https://api.esv.org/v3/passage/text/'.freeze

  # ESV API versions
  ESV_VERSIONS = ['esv'].freeze

  # wldeh/bible-api versions
  WLDEH_VERSIONS = ['en-asv', 'en-t4t', 'en-bsb', 'en-web'].freeze

  class ApiError < StandardError; end

  def initialize(verse)
    @verse = verse
  end

  def fetch_text(version)
    validate_version!(version)

    # Check if we already have this text cached
    existing = @verse.verse_texts.find_by(version: version)
    return existing.text if existing

    # Fetch from appropriate API
    text = if ESV_VERSIONS.include?(version)
             fetch_from_esv_api
           else
             fetch_from_wldeh_api(version)
           end

    # Cache in database
    @verse.verse_texts.create!(version: version, text: text)

    text
  end

  def fetch_all_versions
    VerseText::SUPPORTED_VERSIONS.keys.each_with_object({}) do |version, result|
      result[version] = fetch_text(version)
    rescue ApiError => e
      result[version] = nil
      Rails.logger.warn("Failed to fetch #{version} for #{@verse.reference}: #{e.message}")
    end
  end

  private

  def validate_version!(version)
    unless VerseText::SUPPORTED_VERSIONS.key?(version)
      raise ApiError, "Unsupported version: #{version}"
    end
  end

  # ============================================
  # ESV API Methods
  # ============================================

  def fetch_from_esv_api
    reference = build_esv_reference
    url = "#{ESV_BASE_URL}?q=#{URI.encode_www_form_component(reference)}" \
          "&include-passage-references=false" \
          "&include-verse-numbers=true" \
          "&include-first-verse-numbers=true" \
          "&include-footnotes=false" \
          "&include-headings=false" \
          "&include-short-copyright=true"

    response = make_esv_request(url)
    passages = response['passages']

    if passages.nil? || passages.empty?
      raise ApiError, "No passage found for #{reference}"
    end

    # Clean up the text - remove extra whitespace but keep the copyright
    passages.first.strip.gsub(/\s+/, ' ')
  end

  def build_esv_reference
    book_name = @verse.bible_book.name
    if @verse.verse_end.present? && @verse.verse_end != @verse.verse_start
      "#{book_name} #{@verse.chapter}:#{@verse.verse_start}-#{@verse.verse_end}"
    else
      "#{book_name} #{@verse.chapter}:#{@verse.verse_start}"
    end
  end

  def make_esv_request(url)
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    configure_ssl(http)

    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Token #{esv_api_token}"

    response = http.request(request)

    unless response.is_a?(Net::HTTPSuccess)
      raise ApiError, "ESV API request failed: #{response.code} #{response.message}"
    end

    JSON.parse(response.body)
  rescue JSON::ParserError => e
    raise ApiError, "Invalid JSON response: #{e.message}"
  end

  def esv_api_token
    # Try environment variable first, then Rails credentials
    ENV['ESV_API_TOKEN'] || Rails.application.credentials.dig(:esv, :api_token) || '91ccf9f7f76587426e9d033cc2f2b71cb380baa1'
  end

  # ============================================
  # wldeh/bible-api Methods
  # ============================================

  def fetch_from_wldeh_api(version)
    # Handle verse ranges by fetching each verse and combining
    if @verse.verse_end.present? && @verse.verse_end != @verse.verse_start
      fetch_wldeh_verse_range(version)
    else
      fetch_wldeh_single_verse(version, @verse.verse_start)
    end
  end

  def fetch_wldeh_single_verse(version, verse_number)
    url = build_wldeh_url(version, verse_number)
    response = make_wldeh_request(url)
    response['text']
  end

  def fetch_wldeh_verse_range(version)
    texts = (@verse.verse_start..@verse.verse_end).map do |verse_num|
      text = fetch_wldeh_single_verse(version, verse_num)
      "[#{verse_num}] #{text}"
    end
    texts.join(' ')
  end

  def build_wldeh_url(version, verse_number)
    book_name = normalize_book_name(@verse.bible_book.name)
    "#{WLDEH_BASE_URL}/#{version}/books/#{book_name}/chapters/#{@verse.chapter}/verses/#{verse_number}.json"
  end

  def normalize_book_name(name)
    # Convert book name to API format (lowercase, handle special cases)
    normalized = name.downcase.gsub(/\s+/, '-')

    # Handle numbered books (e.g., "1 John" -> "1-john")
    normalized = normalized.gsub(/^(\d+)-/, '\1-')

    # Special cases
    case normalized
    when 'song-of-solomon', 'song-of-songs'
      'song-of-solomon'
    when 'psalms'
      'psalms'
    else
      normalized
    end
  end

  def make_wldeh_request(url)
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    configure_ssl(http)

    request = Net::HTTP::Get.new(uri)
    response = http.request(request)

    unless response.is_a?(Net::HTTPSuccess)
      raise ApiError, "API request failed: #{response.code} #{response.message}"
    end

    JSON.parse(response.body)
  rescue JSON::ParserError => e
    raise ApiError, "Invalid JSON response: #{e.message}"
  end

  # ============================================
  # Shared Methods
  # ============================================

  def configure_ssl(http)
    # SSL configuration - in development, we may need to skip verification
    # due to macOS certificate chain issues
    if Rails.env.development? && ENV['SKIP_SSL_VERIFY']
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    else
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      cert_store = OpenSSL::X509::Store.new
      cert_store.set_default_paths
      http.cert_store = cert_store
    end
  end
end
