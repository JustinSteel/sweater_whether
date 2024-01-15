class API::V0::ForecastsController < ApplicationController
  def show
    @coordinates_data = MapquestFacade.get_coordinates("denver,co")
    coordinates = "#{@coordinates_data[:lat]},#{@coordinates_data[:lng]}"
    @forecast = ForecastFacade.get_forecast(params[:location])
    # require 'pry'; binding.pry
  end
end