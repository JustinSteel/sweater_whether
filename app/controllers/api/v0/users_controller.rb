class Api::V0::UsersController < ApplicationController
  def create
    if user_params[:password].blank? || user_params[:password_confirmation].blank?
      render json: { errors: [{ detail: "Password can't be blank" }] }, status: 404
    elsif user_params[:password] != user_params[:password_confirmation]
      render json: { errors: [{ detail: "Passwords don't match, try again." }] }, status: 404
    else
      user = User.create!(user_params.merge(api_key: api_gen))
      render json: UserSerializer.format_user(user), status: 201
    end
  rescue ActiveRecord::RecordInvalid => err
    render json: { errors: [{ detail: err.message }] }, status: 409
  rescue ActiveRecord::StatementInvalid => err
    render json: { errors: [{ detail: err.message }] }, status: 404
  end

  private
  def render_unprocessable_entity_response(exception)
    if exception.record.errors.details[:email].any? { |error| error[:error] == :taken }
      render json: ErrorSerializer.format_errors(exception.record.errors.full_messages), status: 409
    else
      render json: ErrorSerializer.format_errors(exception.record.errors.full_messages), status: 422
    end
  end
  
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def api_gen
    SecureRandom.hex(15)
  end
end
