require "rails_helper"

RSpec.describe Roadtrip, type: :model do
  describe "class methods" do
    it ".valid_key?" do
      user_params = {
          email: "randy@gmail.com",
          password: "password",
          password_confirmation: "password"
        }

        user = User.create!(user_params)

        params = {
          origin: "Houston,TX",
          destination: "Denver,CO",
          api_key: user.api_key
        }

        expect(Roadtrip.valid_key?(params[:api_key])).to eq(true)
      end
  end
end