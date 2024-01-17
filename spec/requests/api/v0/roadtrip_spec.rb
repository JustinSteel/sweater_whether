require 'rails_helper'

RSpec.describe 'RoadTrips API', type: :request do
  describe 'POST #create' do
    describe "POST /api/v0/road_trip", :vcr do
      context "Sending information through the body" do
        it "should create a roadtrip", :vcr do
    
          headers_u = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
          payload_u = {
            email: "user@email.com",
            password: "password",
            password_confirmation: "password"
          }
          body = JSON.generate(payload_u)

          post "/api/v0/users", headers: headers_u, params: body

          headers_r = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
          payload_r = {
            origin: "Houston,TX",
            destination: "Denver,CO",
            api_key: User.last.api_key
          }
          body = JSON.generate(payload_r)
          
          post "/api/v0/road_trip", headers: headers_r, params: body

          expect(response).to be_successful

          response_data = JSON.parse(response.body, symbolize_names: true)

          expect(response_data[:data]).to have_key(:id)
          expect(response_data[:data][:id]).to be_a(String)
          expect(response_data[:data][:id]).to eq("null")

          expect(response_data[:data]).to have_key(:type)
          expect(response_data[:data][:type]).to be_a(String)
          expect(response_data[:data][:type]).to eq("road_trip")

          expect(response_data[:data]).to have_key(:attributes)
          expect(response_data[:data][:attributes]).to be_a(Hash)

          expect(response_data[:data][:attributes]).to have_key(:start_city)
          expect(response_data[:data][:attributes][:start_city]).to be_a(String)

          expect(response_data[:data][:attributes]).to have_key(:end_city)
          expect(response_data[:data][:attributes][:end_city]).to be_a(String)

          expect(response_data[:data][:attributes]).to have_key(:travel_time)
          expect(response_data[:data][:attributes][:travel_time]).to be_a(String)

          expect(response_data[:data][:attributes]).to have_key(:weather_at_eta)
          expect(response_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)

          expect(response_data[:data][:attributes][:weather_at_eta]).to have_key(:datetime)
          expect(response_data[:data][:attributes][:weather_at_eta][:datetime]).to be_a(String)

          expect(response_data[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
          expect(response_data[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)

          expect(response_data[:data][:attributes][:weather_at_eta]).to have_key(:condition)
          expect(response_data[:data][:attributes][:weather_at_eta][:condition]).to be_a(String)
        end

        it "should not create a roadtrip", :vcr do
    
          headers_u = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
          payload_u = {
            email: "user@email.com",
            password: "password",
            password_confirmation: "password"
          }
          body = JSON.generate(payload_u)
          
          post "/api/v0/users", headers: headers_u, params: body

          headers_r = {"CONTENT_TYPE" => "application/json", "Accept" => "application/json"}
          payload_r = {
            origin: "Houston,TX",
            destination: "tokyo,JP",
            api_key: User.last.api_key
          }
          body = JSON.generate(payload_r)
          
          post "/api/v0/road_trip", headers: headers_r, params: body

          expect(response).to be_successful

          response_data = JSON.parse(response.body, symbolize_names: true)

          expect(response_data[:data]).to have_key(:id)
          expect(response_data[:data][:id]).to be_a(String)
          expect(response_data[:data][:id]).to eq("null")

          expect(response_data[:data]).to have_key(:type)
          expect(response_data[:data][:type]).to be_a(String)
          expect(response_data[:data][:type]).to eq("road_trip")

          expect(response_data[:data]).to have_key(:attributes)
          expect(response_data[:data][:attributes]).to be_a(Hash)

          expect(response_data[:data][:attributes]).to have_key(:start_city)
          expect(response_data[:data][:attributes][:start_city]).to be_a(String)

          expect(response_data[:data][:attributes]).to have_key(:end_city)
          expect(response_data[:data][:attributes][:end_city]).to be_a(String)

          expect(response_data[:data][:attributes]).to have_key(:travel_time)
          expect(response_data[:data][:attributes][:travel_time]).to be_a(String)
          expect(response_data[:data][:attributes][:travel_time]).to eq("Impossible")

          expect(response_data[:data][:attributes]).to have_key(:weather_at_eta)
          expect(response_data[:data][:attributes][:weather_at_eta]).to be_a(String)
          expect(response_data[:data][:attributes][:weather_at_eta]).to eq(" ")
        end
      end
    end
  end
end