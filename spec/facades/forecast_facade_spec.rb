require 'rails_helper'

RSpec.describe ForecastFacade, type: :facade do
  describe '.get_forecast' do
    let(:location) { 'cincinnati,oh' }
    let(:coordinates) { { lat: 39.1031, lon: 84.5120 } }
    # let(:forecast) { { temperature: 75, conditions: 'Sunny' } }

    before do
      allow(MapquestService).to receive(:get_coordinates).with(location).and_return(coordinates)
    #   allow(ForecastsService).to receive(:get_forecast).with(coordinates).and_return(forecast)
    end

    xit 'returns a Forecast object', :vcr do
      forecast = ForecastFacade.get_forecast(location)
      require 'pry'; binding.pry
      expect(forecast).to be_a(Forecast)
      expect(forecast.location).to eq(location)
      expect(forecast.current_weather).to eq(forecast)
    end
  end
end