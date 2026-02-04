require 'net/http'
require 'json'

class BibleApiService
  WLDEH_BASE_URL = 'https://cdn.jsdelivr.net/gh/wldeh/bible-api/bibles'.freeze
  ESV_BASE_URL = 'https://api.esv.org/v3/passage/text/'.freeze
  NLT_BASE_URL = 'https://api.nlt.to/api/passages'.freeze
  API_BIBLE_BASE_URL = 'https://rest.api.bible/v1'.freeze

  # ESV API versions
  ESV_VERSIONS = ['esv'].freeze

  # NLT API versions
  NLT_VERSIONS = ['nlt'].freeze

  # API.Bible versions (NIV, NASB, CSB)
  API_BIBLE_VERSIONS = ['niv', 'nasb', 'csb'].freeze
  API_BIBLE_IDS = {
    'niv' => '78a9f6124f344018-01',   # New International Version 2011
    'nasb' => 'b8ee27bcd1cae43a-01',  # New American Standard Bible 1995
    'csb' => 'a556c5305ee15c3f-01'    # Christian Standard Bible
  }.freeze

  # wldeh/bible-api versions
  WLDEH_VERSIONS = ['en-asv', 'en-t4t', 'en-bsb', 'en-web'].freeze

  # Book name to API.Bible book ID mapping
  API_BIBLE_BOOK_IDS = {
    'Genesis' => 'GEN', 'Exodus' => 'EXO', 'Leviticus' => 'LEV', 'Numbers' => 'NUM',
    'Deuteronomy' => 'DEU', 'Joshua' => 'JOS', 'Judges' => 'JDG', 'Ruth' => 'RUT',
    '1 Samuel' => '1SA', '2 Samuel' => '2SA', '1 Kings' => '1KI', '2 Kings' => '2KI',
    '1 Chronicles' => '1CH', '2 Chronicles' => '2CH', 'Ezra' => 'EZR', 'Nehemiah' => 'NEH',
    'Esther' => 'EST', 'Job' => 'JOB', 'Psalms' => 'PSA', 'Proverbs' => 'PRO',
    'Ecclesiastes' => 'ECC', 'Song of Solomon' => 'SNG', 'Isaiah' => 'ISA', 'Jeremiah' => 'JER',
    'Lamentations' => 'LAM', 'Ezekiel' => 'EZK', 'Daniel' => 'DAN', 'Hosea' => 'HOS',
    'Joel' => 'JOL', 'Amos' => 'AMO', 'Obadiah' => 'OBA', 'Jonah' => 'JON',
    'Micah' => 'MIC', 'Nahum' => 'NAM', 'Habakkuk' => 'HAB', 'Zephaniah' => 'ZEP',
    'Haggai' => 'HAG', 'Zechariah' => 'ZEC', 'Malachi' => 'MAL', 'Matthew' => 'MAT',
    'Mark' => 'MRK', 'Luke' => 'LUK', 'John' => 'JHN', 'Acts' => 'ACT',
    'Romans' => 'ROM', '1 Corinthians' => '1CO', '2 Corinthians' => '2CO', 'Galatians' => 'GAL',
    'Ephesians' => 'EPH', 'Philippians' => 'PHP', 'Colossians' => 'COL',
    '1 Thessalonians' => '1TH', '2 Thessalonians' => '2TH', '1 Timothy' => '1TI', '2 Timothy' => '2TI',
    'Titus' => 'TIT', 'Philemon' => 'PHM', 'Hebrews' => 'HEB', 'James' => 'JAS',
    '1 Peter' => '1PE', '2 Peter' => '2PE', '1 John' => '1JN', '2 John' => '2JN',
    '3 John' => '3JN', 'Jude' => 'JUD', 'Revelation' => 'REV'
  }.freeze

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
           elsif NLT_VERSIONS.include?(version)
             fetch_from_nlt_api
           elsif API_BIBLE_VERSIONS.include?(version)
             fetch_from_api_bible(version)
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
  # NLT API Methods
  # ============================================

  def fetch_from_nlt_api
    reference = build_nlt_reference
    url = "#{NLT_BASE_URL}?ref=#{URI.encode_www_form_component(reference)}&version=NLT&key=#{nlt_api_token}"

    html = make_nlt_request(url)
    extract_text_from_nlt_html(html)
  end

  def build_nlt_reference
    book_name = @verse.bible_book.name.gsub(' ', '')
    if @verse.verse_end.present? && @verse.verse_end != @verse.verse_start
      "#{book_name}.#{@verse.chapter}:#{@verse.verse_start}-#{@verse.verse_end}"
    else
      "#{book_name}.#{@verse.chapter}:#{@verse.verse_start}"
    end
  end

  def make_nlt_request(url)
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    configure_ssl(http)

    request = Net::HTTP::Get.new(uri)
    response = http.request(request)

    unless response.is_a?(Net::HTTPSuccess)
      raise ApiError, "NLT API request failed: #{response.code} #{response.message}"
    end

    response.body
  end

  def extract_text_from_nlt_html(html)
    # Extract text from verse_export tags
    # Remove HTML tags but keep the text content
    text = html.dup

    # Remove footnote markers and their content
    text.gsub!(/<a class="a-tn">.*?<\/a>/m, '')
    text.gsub!(/<span class="tn">.*?<\/span>/m, '')

    # Remove verse numbers but keep track we're in verse content
    text.gsub!(/<span class="vn">\d+<\/span>/, '')

    # Extract just the content from verse_export
    if text =~ /<verse_export[^>]*>(.*?)<\/verse_export>/m
      text = $1
    end

    # Remove remaining HTML tags
    text.gsub!(/<[^>]+>/, ' ')

    # Clean up whitespace
    text.gsub!(/\s+/, ' ')
    text.strip!

    # Add NLT copyright notice
    text += " (NLT)"

    text
  end

  def nlt_api_token
    # Try environment variable first, then Rails credentials
    ENV['NLT_API_TOKEN'] || Rails.application.credentials.dig(:nlt, :api_token) || 'b003ce3e-5f39-4fce-8b62-fa688192b413'
  end

  # ============================================
  # API.Bible Methods (NIV, NASB, CSB)
  # ============================================

  def fetch_from_api_bible(version)
    bible_id = API_BIBLE_IDS[version]
    passage_id = build_api_bible_passage_id

    url = "#{API_BIBLE_BASE_URL}/bibles/#{bible_id}/passages/#{passage_id}?content-type=text&include-notes=false&include-titles=false&include-chapter-numbers=false&include-verse-numbers=true"

    response = make_api_bible_request(url)
    content = response.dig('data', 'content')
    copyright = response.dig('data', 'copyright')

    if content.nil? || content.empty?
      raise ApiError, "No passage found for #{@verse.reference}"
    end

    # Clean up the text and append abbreviated copyright
    clean_api_bible_text(content, version, copyright)
  end

  def build_api_bible_passage_id
    book_id = API_BIBLE_BOOK_IDS[@verse.bible_book.name]
    raise ApiError, "Unknown book: #{@verse.bible_book.name}" if book_id.nil?

    if @verse.verse_end.present? && @verse.verse_end != @verse.verse_start
      "#{book_id}.#{@verse.chapter}.#{@verse.verse_start}-#{book_id}.#{@verse.chapter}.#{@verse.verse_end}"
    else
      "#{book_id}.#{@verse.chapter}.#{@verse.verse_start}"
    end
  end

  def make_api_bible_request(url)
    uri = URI(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    configure_ssl(http)

    request = Net::HTTP::Get.new(uri)
    request['api-key'] = api_bible_token

    response = http.request(request)

    unless response.is_a?(Net::HTTPSuccess)
      raise ApiError, "API.Bible request failed: #{response.code} #{response.message}"
    end

    JSON.parse(response.body)
  rescue JSON::ParserError => e
    raise ApiError, "Invalid JSON response: #{e.message}"
  end

  def clean_api_bible_text(content, version, copyright)
    # Remove leading/trailing whitespace and normalize internal whitespace
    text = content.strip.gsub(/\s+/, ' ')

    # Add short version indicator
    version_label = case version
                    when 'niv' then 'NIV'
                    when 'nasb' then 'NASB'
                    when 'csb' then 'CSB'
                    end

    "#{text} (#{version_label})"
  end

  def api_bible_token
    # Try environment variable first, then Rails credentials
    ENV['API_BIBLE_TOKEN'] || Rails.application.credentials.dig(:api_bible, :api_token) || 'xBKtZBC7hMR5v0T_4Vmj7'
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
