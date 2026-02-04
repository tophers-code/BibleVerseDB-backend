module Api
  module V1
    class BibleBooksController < BaseController
      def index
        @bible_books = BibleBook.all

        # Filter to only books that have verses
        if params[:with_verses].present?
          @bible_books = @bible_books.joins(:verses).distinct
        end

        # Filter to only books that have verses in a specific category
        if params[:category_id].present?
          @bible_books = @bible_books.joins(verses: :categories)
                                     .where(categories: { id: params[:category_id] })
                                     .distinct
        end

        render json: @bible_books
      end

      def show
        @bible_book = BibleBook.find(params[:id])
        render json: @bible_book, include: { verses: { include: :categories } }
      end
    end
  end
end
