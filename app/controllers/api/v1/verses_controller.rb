module Api
  module V1
    class VersesController < BaseController
      def index
        @verses = Verse.includes(:bible_book, :categories)

        if params[:bible_book_id].present?
          @verses = @verses.where(bible_book_id: params[:bible_book_id])
        end

        if params[:category_id].present?
          @verses = @verses.joins(:categories).where(categories: { id: params[:category_id] })
        end

        render json: @verses.map { |v| verse_summary(v) }
      end

      def show
        @verse = Verse.includes(:bible_book, :categories, :referenced_verses, :referencing_verses).find(params[:id])
        render json: verse_with_associations(@verse)
      end

      def create
        @verse = Verse.new(verse_params)

        if params[:category_ids].present?
          @verse.category_ids = params[:category_ids]
        end

        @verse.save!
        render json: verse_summary(@verse), status: :created
      end

      def update
        @verse = Verse.find(params[:id])
        @verse.update!(verse_params)

        if params[:category_ids].present?
          @verse.category_ids = params[:category_ids]
        end

        render json: verse_summary(@verse)
      end

      def destroy
        @verse = Verse.find(params[:id])
        @verse.destroy!
        head :no_content
      end

      # GET /verses/:id/texts
      def texts
        @verse = Verse.includes(:bible_book, :verse_texts).find(params[:id])
        version = params[:version]

        if version.present?
          # Fetch specific version
          service = BibleApiService.new(@verse)
          text = service.fetch_text(version)
          render json: { version: version, text: text, version_name: VerseText::SUPPORTED_VERSIONS[version] }
        else
          # Return all cached texts
          render json: {
            supported_versions: VerseText::SUPPORTED_VERSIONS,
            texts: @verse.verse_texts.map { |vt| { version: vt.version, text: vt.text, version_name: VerseText::SUPPORTED_VERSIONS[vt.version] } }
          }
        end
      rescue BibleApiService::ApiError => e
        render json: { error: e.message }, status: :service_unavailable
      end

      # POST /verses/:id/fetch_texts
      def fetch_texts
        @verse = Verse.includes(:bible_book).find(params[:id])
        service = BibleApiService.new(@verse)
        results = service.fetch_all_versions

        render json: {
          reference: @verse.reference,
          texts: results.filter { |_, text| text.present? }.map { |version, text| { version: version, text: text, version_name: VerseText::SUPPORTED_VERSIONS[version] } }
        }
      rescue BibleApiService::ApiError => e
        render json: { error: e.message }, status: :service_unavailable
      end

      private

      def verse_params
        params.require(:verse).permit(:bible_book_id, :chapter, :verse_start, :verse_end, :notes)
      end

      def verse_summary(verse)
        {
          id: verse.id,
          reference: verse.reference,
          bible_book: verse.bible_book,
          chapter: verse.chapter,
          verse_start: verse.verse_start,
          verse_end: verse.verse_end,
          notes: verse.notes,
          categories: verse.categories,
          created_at: verse.created_at,
          updated_at: verse.updated_at
        }
      end

      def verse_with_associations(verse)
        {
          id: verse.id,
          reference: verse.reference,
          bible_book: verse.bible_book,
          chapter: verse.chapter,
          verse_start: verse.verse_start,
          verse_end: verse.verse_end,
          notes: verse.notes,
          categories: verse.categories,
          referenced_verses: verse.referenced_verses.map { |v| { id: v.id, reference: v.reference } },
          referencing_verses: verse.referencing_verses.map { |v| { id: v.id, reference: v.reference } },
          created_at: verse.created_at,
          updated_at: verse.updated_at
        }
      end
    end
  end
end
