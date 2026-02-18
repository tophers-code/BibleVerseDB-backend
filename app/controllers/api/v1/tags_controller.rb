module Api
  module V1
    class TagsController < BaseController
      def index
        @tags = Tag.left_joins(:verses)
                    .select('tags.*, COUNT(verses.id) as verses_count')
                    .group('tags.id')

        if params[:with_verses].present?
          @tags = @tags.having('COUNT(verses.id) > 0')
        end

        if params[:bible_book_id].present?
          @tags = Tag.joins(:verses)
                     .where(verses: { bible_book_id: params[:bible_book_id] })
                     .select('tags.*, COUNT(verses.id) as verses_count')
                     .group('tags.id')
        end

        if params[:category_id].present?
          @tags = Tag.joins(verses: :categories)
                     .where(categories: { id: params[:category_id] })
                     .select('tags.*, COUNT(DISTINCT verses.id) as verses_count')
                     .group('tags.id')
        end

        render json: @tags.order(:name).map { |t| tag_with_count(t) }
      end

      def show
        @tag = Tag.find(params[:id])
        render json: @tag
      end

      def create
        @tag = Tag.new(tag_params)
        @tag.save!
        render json: @tag, status: :created
      end

      def update
        @tag = Tag.find(params[:id])
        @tag.update!(tag_params)
        render json: @tag
      end

      def destroy
        @tag = Tag.find(params[:id])
        @tag.destroy!
        head :no_content
      end

      private

      def tag_params
        params.require(:tag).permit(:name, :description)
      end

      def tag_with_count(tag)
        {
          id: tag.id,
          name: tag.name,
          description: tag.description,
          verses_count: tag.verses_count.to_i,
          created_at: tag.created_at,
          updated_at: tag.updated_at
        }
      end
    end
  end
end
