module Api
  module V1
    class BibleBooksController < BaseController
      def index
        @bible_books = BibleBook.all
        render json: @bible_books
      end

      def show
        @bible_book = BibleBook.find(params[:id])
        render json: @bible_book, include: { verses: { include: :categories } }
      end
    end
  end
end
