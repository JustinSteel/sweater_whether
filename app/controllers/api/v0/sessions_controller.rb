class Api::V0::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.format_user(user), status: 200
    else
      render json: ErrorSerializer.format_errors("Credentials are bad"), status: 401
    end
  end
end