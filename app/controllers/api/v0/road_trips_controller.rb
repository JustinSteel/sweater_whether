class Api::V0::RoadTripsController < ApplicationController
  def create
    if Roadtrip.valid_key?(params[:api_key])
    @roadtrip = RoadtripFacade.get_roadtrip(params[:origin], params[:destination])
    @location = MapquestFacade.get_location(params[:destination])
    @arrival_forecast = ForecastFacade.get_arrival_forecast(@location, @roadtrip.hour)
    render json: RoadtripSerializer.format_roadtrip(@roadtrip, @arrival_forecast)
    else
      render json: { error: "Invalid API key" }, status: 401
    end
    rescue StandardError => err
      render json: ErrorSerializer.format_errors(err.message), status: 404
  end
end