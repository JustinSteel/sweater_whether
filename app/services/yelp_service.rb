class YelpService
  def self.get_restaurant(location, food)
    get_url("?location=#{location}&term=#{food}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search") do |faraday|
      faraday.headers["Authorization"] = "Bearer #{Rails.application.credentials.yelpapi.api_key}"
    end
  end
end