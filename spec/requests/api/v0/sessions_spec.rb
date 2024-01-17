require "rails_helper"

RSpec.describe "Create", type: :request do
  describe "POST /api/v0/sessions", :vcr do
    context "Sending information through the body" do
      it "should create a session", :vcr do
        headers_u = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
        payload_u = {
          email: "user@email.com",
          password: "password",
          password_confirmation: "password"
        }
        body_u = JSON.generate(payload_u)

        post "/api/v0/users", headers: headers_u, params: body_u

        headers_s = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
        payload_s = {
          email: "user@email.com",
          password: "password"
        }
        body_s = JSON.generate(payload_s)

        post "/api/v0/sessions", headers: headers_s, params: body_s

        expect(response).to be_successful

        response_data = JSON.parse(response.body, symbolize_names: true)

        expect(response_data[:data]).to have_key(:id)
        expect(response_data[:data][:id]).to be_a(String)

        expect(response_data[:data]).to have_key(:type)
        expect(response_data[:data][:type]).to be_a(String)
        expect(response_data[:data][:type]).to eq("users")

        expect(response_data[:data]).to have_key(:attributes)
        expect(response_data[:data][:attributes]).to be_a(Hash)

        expect(response_data[:data][:attributes]).to have_key(:email)
        expect(response_data[:data][:attributes][:email]).to be_a(String)
        expect(response_data[:data][:attributes][:email]).to eq("user@email.com")

        expect(response_data[:data][:attributes]).to have_key(:api_key)
        expect(response_data[:data][:attributes][:api_key]).to be_a(String)

        expect(response_data[:data][:attributes]).to_not have_key(:password)
        expect(response_data[:data][:attributes]).to_not have_key(:password_confirmation)
      end
    end

    context "sad path" do
      it "shant login if emails differ", :vcr do
        headers_u = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
        payload_u = {
          email: "email@email.com",
          password: "password",
          password_confirmation: "password"
        }
        body_u = JSON.generate(payload_u)

        post "/api/v0/users", headers: headers_u, params: body_u

        headers_s = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
        payload_s = {
          email: "wiggle@email.com",
          password: "password"
        }
        body_s = JSON.generate(payload_s)

        post "/api/v0/sessions", headers: headers_s, params: body_s

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to_not be_successful
        expect(response).to have_http_status(401)

        expect(response_data).to have_key(:errors)
        expect(response_data[:errors].first).to have_key(:detail)

        expect(response_data[:errors].first[:detail]).to eq("Credentials are bad")
      end

      it "shant login if passwords differ", :vcr do
        headers_u = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
        payload_u = {
          email: "email@email.com",
          password: "password",
          password_confirmation: "password"
        }
        body_u = JSON.generate(payload_u)

        post "/api/v0/users", headers: headers_u, params: body_u

        headers_s = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
        payload_s = {
          email: "email@email.com",
          password: "passwords"
        }
        body_s = JSON.generate(payload_s)

        post "/api/v0/sessions", headers: headers_s, params: body_s

        response_data = JSON.parse(response.body, symbolize_names: true)
        expect(response).to_not be_successful
        expect(response).to have_http_status(401)

        expect(response_data).to have_key(:errors)
        expect(response_data[:errors].first).to have_key(:detail)

        expect(response_data[:errors].first[:detail]).to eq("Credentials are bad")
      end
    end
  end
end
