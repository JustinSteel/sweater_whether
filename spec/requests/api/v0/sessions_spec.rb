require "rails_helper"

RSpec.describe "Create", type: :request do
  describe "sessions#create" do
    it "creates a new session" do
      headers
      user = User.create(email: "randy@gmail.com", password: "password", password_confirmation: "password")

      post "/api/v0/sessions", params: {email: "randy@gmail.com", password: "password"}

      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it "returns an error if credentials are bad" do
      user = User.create(email: "randy@gmail.com", password: "password", password_confirmation: "password")

      post "/api/v0/sessions", params: {email: "randy@gmail.com", password: "bad_password"}

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
      expect(response.body).to have_key([:errors])
      expect(response.body["errors"]).to be_an(Array)
      expect(response.body["errors"].first).to have_key("detail")
      expect(response.body["errors"].first["detail"]).to eq("Credentials are bad")
      expect(response.body).to eq("{\"errors\":[{\"detail\":\"Credentials are bad\"}]}")
    end
  end
end