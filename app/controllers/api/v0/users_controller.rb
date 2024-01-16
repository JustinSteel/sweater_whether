class Api::V0::UsersController < ApplicationController
  def create
    user = User.new(user_params.merge(api_key: api_gen))
    if user.save
      render json: UserSerializer.format_user(user), status: 201
    else
      render json: ErrorSerializer.format_errors(user.errors.full_messages.join(", ")), status: 422
    end
  rescue ActiveRecord::RecordInvalid => err
    render json: ErrorSerializer.format_errors(err.message), status: 409
  rescue ActiveRecord::StatementInvalid => err
    render json: ErrorSerializer.format_errors(err.message), status: 404
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def api_gen
    SecureRandom.hex(15)
  end
end
