class ForecastFacade


  def self.current(location)
    json = WeatherService.get_forecast(location)
    Current.new(json[:current])
  end
  
  def self.daily(location)
    json = WeatherService.get_forecast(location)
    json[:forecast][:forecastday].map do |data|
      Daily.new(data)
    end
  end

  def self.hourly(location)
    json = WeatherService.get_forecast(location)
    day = json[:forecast][:forecastday].map do |data|
      data[:hour].map do |h|
        Hourly.new(h)
      end
    end
    day[0]
  end
end
