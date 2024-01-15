# class ForecastsService
#   def self.conn
#     Faraday.new(url: 'http://api.weatherapi.com/v1/forecast.json')
#   end

#   def self.get_forecast(coordinates)
#     response = conn.get("?key=#{api_key}&q=#{coordinates}&days=5")
#     JSON.parse(response.body, symbolize_names: true)
#   end

#   def self.api_key
#     Rails.application.credentials.weatherapi.api_key
#   end
# end

class WeatherService

  def self.get_forecast(location)
    get_url("forecast.json?q=#{location.lat}+#{location.lng}&days=5")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://api.weatherapi.com/v1/") do |faraday|
      faraday.headers["key"] = Rails.application.credentials.weather[:api_key]
    end
  end
end