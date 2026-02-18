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

        render json: @tags.order(:name).map { |t| { id: t.id, name: t.name, verses_count: t.verses_count.to_i } }
      end
    end
  end
end
