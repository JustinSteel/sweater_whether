class Api::V1::MunchiesController < ApplicationController
  def index
    @location = MapquestFacade.get_location(Forecast.location_present(params[:destination]))
    @forecast = ForecastFacade.current(@location)
    @restaurant = YelpFacade.get_restaurant(params[:destination], params[:food])
  
    render json: MunchieSerializer.munchies_data(params[:destination], @forecast, @restaurant)
  end
end