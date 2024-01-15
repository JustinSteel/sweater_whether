class ForecastFacade
  def self.get_forecast(location)
    coordinates = MapquestService.get_coordinates(location)
    # require 'pry'; binding.pry
    cords = "#{coordinates[:lat]},#{coordinates[:lng]}"
    forecast = ForecastsService.get_forecast(cords)
    Forecast.new(forecast, location)
  end
end
