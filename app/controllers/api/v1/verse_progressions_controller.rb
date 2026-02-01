module Api
  module V1
    class VerseProgressionsController < BaseController
      def index
        @progressions = VerseProgression.includes(progression_steps: { verse: :bible_book })
        render json: @progressions.map { |p| progression_with_steps(p) }
      end

      def show
        @progression = VerseProgression.includes(progression_steps: { verse: :bible_book }).find(params[:id])
        render json: progression_with_steps(@progression)
      end

      def create
        @progression = VerseProgression.new(progression_params)
        @progression.save!
        render json: @progression, status: :created
      end

      def update
        @progression = VerseProgression.find(params[:id])
        @progression.update!(progression_params)
        render json: progression_with_steps(@progression)
      end

      def destroy
        @progression = VerseProgression.find(params[:id])
        @progression.destroy!
        head :no_content
      end

      private

      def progression_params
        params.require(:progression).permit(:name, :description)
      end

      def progression_with_steps(progression)
        {
          id: progression.id,
          name: progression.name,
          description: progression.description,
          steps: progression.progression_steps.map do |step|
            {
              id: step.id,
              step_order: step.step_order,
              verse: {
                id: step.verse.id,
                reference: step.verse.reference
              }
            }
          end,
          created_at: progression.created_at,
          updated_at: progression.updated_at
        }
      end
    end
  end
end
