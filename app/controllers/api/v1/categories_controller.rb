module Api
  module V1
    class CategoriesController < BaseController
      def index
        @categories = Category.left_joins(:verses)
                              .select('categories.*, COUNT(verses.id) as verses_count')
                              .group('categories.id')
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
