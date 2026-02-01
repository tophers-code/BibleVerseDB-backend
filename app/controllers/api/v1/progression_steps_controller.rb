module Api
  module V1
    class ProgressionStepsController < BaseController
      before_action :set_progression

      def create
        @step = @progression.progression_steps.new(step_params)
        @step.save!
        render json: step_response(@step), status: :created
      end

      def update
        @step = @progression.progression_steps.find(params[:id])
        @step.update!(step_params)
        render json: step_response(@step)
      end

      def destroy
        @step = @progression.progression_steps.find(params[:id])
        @step.destroy!
        head :no_content
      end

      private

      def set_progression
        @progression = VerseProgression.find(params[:progression_id])
      end

      def step_params
        params.require(:step).permit(:verse_id, :step_order)
      end

      def step_response(step)
        {
          id: step.id,
          step_order: step.step_order,
          verse: {
            id: step.verse.id,
            reference: step.verse.reference
          }
        }
      end
    end
  end
end
