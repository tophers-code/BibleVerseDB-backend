module Api
  module V1
    class VerseTextsController < BaseController
      PROVIDERS = [
        { name: 'ESV API', versions: BibleApiService::ESV_VERSIONS },
        { name: 'NLT API', versions: BibleApiService::NLT_VERSIONS },
        { name: 'API.Bible', versions: BibleApiService::API_BIBLE_VERSIONS },
        { name: 'wldeh/bible-api', versions: BibleApiService::WLDEH_VERSIONS }
      ].freeze

      def status
        total_verses = Verse.count
        fetched_counts = VerseText.group(:version).count

        providers = PROVIDERS.map do |provider|
          versions = provider[:versions].map do |code|
            fetched = fetched_counts[code] || 0
            {
              code: code,
              name: VerseText::SUPPORTED_VERSIONS[code],
              missing_count: total_verses - fetched,
              fetched_count: fetched
            }
          end

          { name: provider[:name], versions: versions }
        end

        render json: { total_verses: total_verses, providers: providers }
      end

      def batch_fetch
        version = params[:version]

        unless VerseText::SUPPORTED_VERSIONS.key?(version)
          return render json: { error: "Unsupported version: #{version}" }, status: :unprocessable_entity
        end

        verses_missing = Verse.where.not(
          id: VerseText.where(version: version).select(:verse_id)
        ).includes(:bible_book)

        results = verses_missing.map do |verse|
          service = BibleApiService.new(verse)
          begin
            text = service.fetch_text(version)
            { verse_id: verse.id, reference: verse.reference, status: 'success', text: text }
          rescue BibleApiService::ApiError => e
            { verse_id: verse.id, reference: verse.reference, status: 'error', error: e.message }
          end
        end

        render json: { version: version, results: results }
      end
    end
  end
end
