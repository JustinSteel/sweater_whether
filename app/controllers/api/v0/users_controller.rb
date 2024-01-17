class Api::V0::UsersController < ApplicationController
  def create
    if user_params[:password].blank? || user_params[:password_confirmation].blank?
      render json: { errors: [{ detail: "Password can't be blank" }] }, status: 404
    elsif user_params[:password] != user_params[:password_confirmation]
      render json: { errors: [{ detail: "Passwords don't match, try again." }] }, status: 404
    else
      begin
        user = User.create!(user_params.merge(api_key: api_gen))
        render json: UserSerializer.format_user(user), status: 201
      rescue ActiveRecord::RecordInvalid => err
        render json: { errors: [{ detail: err.message }] }, status: 409
      end
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def api_gen
    SecureRandom.hex(15)
  end
end
