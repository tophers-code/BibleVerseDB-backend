module Api
  module V1
    class VerseReferencesController < BaseController
      before_action :set_verse

      def create
        @reference = @verse.outgoing_references.new(referenced_verse_id: params[:referenced_verse_id])
        @reference.save!
        render json: { message: "Reference added", referenced_verse: @reference.referenced_verse.reference }, status: :created
      end

      def destroy
        @reference = @verse.outgoing_references.find_by!(referenced_verse_id: params[:id])
        @reference.destroy!
        head :no_content
      end

      private

      def set_verse
        @verse = Verse.find(params[:verse_id])
      end
    end
  end
end
