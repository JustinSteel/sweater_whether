class ForecastFacade


  def self.current(location)
    # require 'pry'; binding.pry
    json = WeatherService.get_forecast(location)
    Current.new(json[:current])
    # require 'pry'; binding.pry
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

  def self.get_arrival_forecast(location, hour)
    json = WeatherService.get_arrival_forecast(location, hour)
    day = json[:forecast][:forecastday].map do |data|
      Hourly.new(data[:hour].first)
    end
    day.first
  end
end
