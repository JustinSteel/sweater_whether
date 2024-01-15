class WeatherService

  def self.get_forecast(location)
    get_url("?q=#{location.lat}+#{location.lng}&days=5")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://api.weatherapi.com/v1/forecast.json") do |faraday|
      faraday.headers["key"] = Rails.application.credentials.weatherapi.api_key
    end
  end
end