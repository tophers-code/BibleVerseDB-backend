module Api
  module V1
    class CategoriesController < BaseController
      def index
        # Base query with verse count
        @categories = Category.left_joins(:verses)
                              .select('categories.*, COUNT(verses.id) as verses_count')
                              .group('categories.id')

        # Filter to only categories that have verses
        if params[:with_verses].present?
          @categories = @categories.having('COUNT(verses.id) > 0')
        end

        # Filter to only categories that have verses in a specific book
        if params[:bible_book_id].present?
          @categories = Category.joins(:verses)
                                .where(verses: { bible_book_id: params[:bible_book_id] })
                                .select('categories.*, COUNT(verses.id) as verses_count')
                                .group('categories.id')
        end

        render json: @categories.map { |c| category_with_count(c) }
      end

      def show
        @category = Category.find(params[:id])
        render json: @category, include: { verses: { include: :bible_book } }
      end

      def create
        @category = Category.new(category_params)
        @category.save!
        render json: @category, status: :created
      end

      def update
        @category = Category.find(params[:id])
        @category.update!(category_params)
        render json: @category
      end

      def destroy
        @category = Category.find(params[:id])
        @category.destroy!
        head :no_content
      end

      private

      def category_params
        params.require(:category).permit(:name, :meaning, :color_code)
      end

      def category_with_count(category)
        {
          id: category.id,
          name: category.name,
          meaning: category.meaning,
          color_code: category.color_code,
          verses_count: category.verses_count.to_i,
          created_at: category.created_at,
          updated_at: category.updated_at
        }
      end
    end
  end
end
