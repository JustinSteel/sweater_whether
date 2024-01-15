class Api::V0::ForecastsController < ApplicationController
  def index
    begin
      @location = MapquestFacade.get_location(Forecast.location_present(params[:location]))
      @current = ForecastFacade.current(@location)
      @daily = ForecastFacade.daily(@location)
      @hourly = ForecastFacade.hourly(@location)
      
    render json: ForecastSerializer.weather_data(@current, @daily, @hourly)
    rescue StandardError => e
      render json: ErrorSerializer.format_errors(e.message), status: 404
    end
  end

  
end