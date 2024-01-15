require 'rails_helper'

RSpec.describe "Forecast API" do
  describe "happy path" do
    it "can get forecast for a city" do
      get '/api/v0/forecast?location=denver,co'
# require 'pry'; binding.pry
      puts response.status
      expect(response).to be_successful
      expect(response.status).to eq(200)

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast).to be_a(Hash)
      expect(forecast).to have_key(:data)
      expect(forecast[:data]).to be_a(Hash)
      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq(nil)
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq('forecast')
      expect(forecast[:data]).to have_key(:attributes)
      expect(forecast[:data][:attributes]).to be_a(Hash)
      expect(forecast[:data][:attributes]).to have_key(:location)
      expect(forecast[:data][:attributes][:location]).to be_a(String)
      expect(forecast[:data][:attributes]).to have_key(:current_weather)
      expect(forecast[:data][:attributes][:current_weather]).to be_a(Hash)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:datetime)
      expect(forecast[:data][:attributes][:current_weather][:datetime]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunrise)
      expect(forecast[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:sunset)
      expect(forecast[:data][:attributes][:current_weather][:sunset]).to be_a(String)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:temperature)
      expect(forecast[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:feels_like)
      expect(forecast[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
      expect(forecast[:data][:attributes][:current_weather]).to have_key(:humidity)
      expect(forecast[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
    end
  end
end