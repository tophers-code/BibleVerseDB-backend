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
        # Reorder remaining steps to close gaps
        @progression.progression_steps.order(:step_order).each_with_index do |step, index|
          step.update_column(:step_order, index + 1) if step.step_order != index + 1
        end
        head :no_content
      end

      # POST /progressions/:progression_id/steps/reorder
      def reorder
        step_ids = params[:step_ids]

        unless step_ids.is_a?(Array) && step_ids.length == @progression.progression_steps.count
          render json: { error: 'Invalid step_ids array' }, status: :unprocessable_entity
          return
        end

        ActiveRecord::Base.transaction do
          # First, set all to negative values to avoid uniqueness conflicts
          @progression.progression_steps.each_with_index do |step, i|
            step.update_column(:step_order, -(i + 1))
          end

          # Then set to the new order
          step_ids.each_with_index do |step_id, index|
            step = @progression.progression_steps.find(step_id)
            step.update_column(:step_order, index + 1)
          end
        end

        render json: { success: true }
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
