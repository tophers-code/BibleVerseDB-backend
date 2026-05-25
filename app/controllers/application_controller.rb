class ApplicationController < ActionController::API
  private

  def jwt_secret
    Rails.application.secret_key_base
  end

  def encode_token(payload)
    JWT.encode(payload, jwt_secret, "HS256")
  end

  def decode_token(token)
    JWT.decode(token, jwt_secret, true, algorithm: "HS256").first
  rescue JWT::DecodeError
    nil
  end

  def current_user
    @current_user ||= begin
      token = request.headers["Authorization"]&.split(" ")&.last
      payload = decode_token(token)
      User.find(payload["user_id"]) if payload
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

  def authenticate!
    render json: { error: "Unauthorized" }, status: :unauthorized unless current_user
  end

  def require_admin!
    render json: { error: "Forbidden" }, status: :forbidden unless current_user&.admin?
  end
end
