class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates_presence_of :password_digest
  validates :password, presence: true, on: :create

  has_secure_password
end
