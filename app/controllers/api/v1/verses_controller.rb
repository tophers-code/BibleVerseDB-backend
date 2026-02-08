module Api
  module V1
    class VersesController < BaseController
      def index
        @verses = Verse.includes(:bible_book, :categories)
                       .joins(:bible_book)
                       .order('bible_books.book_order, verses.chapter, verses.verse_start')

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
        @verse.save!

        update_category_assignments(@verse)

        render json: verse_summary(@verse), status: :created
      end

      def update
        @verse = Verse.find(params[:id])
        @verse.update!(verse_params)

        update_category_assignments(@verse)

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

      # DELETE /verses/:id/texts/:version
      def delete_text
        @verse = Verse.find(params[:id])
        verse_text = @verse.verse_texts.find_by(version: params[:version])

        if verse_text
          verse_text.destroy!
          head :no_content
        else
          render json: { error: 'Verse text not found' }, status: :not_found
        end
      end

      private

      def verse_params
        params.require(:verse).permit(:bible_book_id, :chapter, :verse_start, :verse_end, :notes)
      end

      def update_category_assignments(verse)
        return unless params[:category_ids].present?

        category_ids = params[:category_ids].map(&:to_i)
        category_notes = params[:category_notes] || {}

        # Remove categories that are no longer selected
        verse.verse_categories.where.not(category_id: category_ids).destroy_all

        # Add or update categories
        category_ids.each do |cat_id|
          vc = verse.verse_categories.find_or_initialize_by(category_id: cat_id)
          vc.notes = category_notes[cat_id.to_s]
          vc.save!
        end
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
          categories: categories_with_notes(verse),
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
          categories: categories_with_notes(verse),
          referenced_verses: verse.referenced_verses.map { |v| { id: v.id, reference: v.reference } },
          referencing_verses: verse.referencing_verses.map { |v| { id: v.id, reference: v.reference } },
          created_at: verse.created_at,
          updated_at: verse.updated_at
        }
      end

      def categories_with_notes(verse)
        verse.verse_categories.includes(:category).map do |vc|
          {
            id: vc.category.id,
            name: vc.category.name,
            meaning: vc.category.meaning,
            color_code: vc.category.color_code,
            category_note: vc.notes
          }
        end
      end
    end
  end
end
