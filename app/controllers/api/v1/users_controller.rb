module Api
  module V1
    class UsersController < BaseController
      before_action :set_user, only: [:update, :destroy]

      def index
        users = User.order(:email).select(:id, :email, :role, :created_at)
        render json: users
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user_json(user), status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if params[:user][:password].present?
          @user.password = params[:user][:password]
        end
        @user.role = params[:user][:role] if params[:user][:role].present?

        if @user.save
          render json: user_json(@user)
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @user.id == current_user.id
          render json: { error: "You cannot delete your own account." }, status: :unprocessable_entity
          return
        end
        @user.destroy
        head :no_content
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :password, :role)
      end

      def user_json(user)
        { id: user.id, email: user.email, role: user.role, created_at: user.created_at }
      end
    end
  end
end
