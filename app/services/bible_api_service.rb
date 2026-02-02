require 'net/http'
require 'json'

class BibleApiService
  BASE_URL = 'https://cdn.jsdelivr.net/gh/wldeh/bible-api/bibles'.freeze

  class ApiError < StandardError; end

  def initialize(verse)
    @verse = verse
  end

  def fetch_text(version)
    validate_version!(version)

    # Check if we already have this text cached
    existing = @verse.verse_texts.find_by(version: version)
    return existing.text if existing

    # Fetch from API
    text = fetch_from_api(version)

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

  def fetch_from_api(version)
    # Handle verse ranges by fetching each verse and combining
    if @verse.verse_end.present? && @verse.verse_end != @verse.verse_start
      fetch_verse_range(version)
    else
      fetch_single_verse(version, @verse.verse_start)
    end
  end

  def fetch_single_verse(version, verse_number)
    url = build_url(version, verse_number)
    response = make_request(url)
    response['text']
  end

  def fetch_verse_range(version)
    texts = (@verse.verse_start..@verse.verse_end).map do |verse_num|
      text = fetch_single_verse(version, verse_num)
      "[#{verse_num}] #{text}"
    end
    texts.join(' ')
  end

  def build_url(version, verse_number)
    book_name = normalize_book_name(@verse.bible_book.name)
    "#{BASE_URL}/#{version}/books/#{book_name}/chapters/#{@verse.chapter}/verses/#{verse_number}.json"
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

  def make_request(url)
    uri = URI(url)
    response = Net::HTTP.get_response(uri)

    unless response.is_a?(Net::HTTPSuccess)
      raise ApiError, "API request failed: #{response.code} #{response.message}"
    end

    JSON.parse(response.body)
  rescue JSON::ParserError => e
    raise ApiError, "Invalid JSON response: #{e.message}"
  rescue StandardError => e
    raise ApiError, "Request failed: #{e.message}"
  end
end
