module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params[:email]&.downcase)

        if user&.authenticate(params[:password])
          token = encode_token({ user_id: user.id, exp: 30.days.from_now.to_i })
          render json: { token: token, user: { id: user.id, email: user.email, role: user.role } }
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end
    end
  end
end
