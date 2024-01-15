class MapquestService
  def self.get_coordinates(location)
    response = conn.get("?key=#{api_key}&location=#{location}")
    # require 'pry'; binding.pry
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results][0][:locations][0][:latLng]
  end

  def self.api_key
    Rails.application.credentials.mapquestapi.consumer_key
  end

  def self.conn
    Faraday.new(url: "https://www.mapquestapi.com/geocoding/v1/address")
  end
end