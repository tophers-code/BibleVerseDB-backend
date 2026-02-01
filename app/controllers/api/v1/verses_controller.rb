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

        render json: @verses, include: [:bible_book, :categories]
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
        render json: @verse, include: [:bible_book, :categories], status: :created
      end

      def update
        @verse = Verse.find(params[:id])
        @verse.update!(verse_params)

        if params[:category_ids].present?
          @verse.category_ids = params[:category_ids]
        end

        render json: @verse, include: [:bible_book, :categories]
      end

      def destroy
        @verse = Verse.find(params[:id])
        @verse.destroy!
        head :no_content
      end

      private

      def verse_params
        params.require(:verse).permit(:bible_book_id, :chapter, :verse_start, :verse_end, :notes)
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
