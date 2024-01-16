class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates_presence_of :password_digest
  validates :password, presence: true, on: :create

  has_secure_password

  # def self.correct_info?(user_params)
  #   user = User.find_by(email: user_params[:email])
  #   if user && user.authenticate(user_params[:password])
  #     true
  #   else
  #     raise ActiveRecord::StatementInvalid, "Email or Password is Invalid"
  #   end
  # end
end
