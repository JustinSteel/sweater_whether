class ForecastsService
  def self.conn
    Faraday.new(url: 'http://api.weatherapi.com/v1/forecast.json')
  end

  def self.get_forecast(coordinates)
    response = conn.get("?key=#{api_key}&q=#{coordinates}&days=5")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.api_key
    Rails.application.credentials.weatherapi.api_key
  end
end