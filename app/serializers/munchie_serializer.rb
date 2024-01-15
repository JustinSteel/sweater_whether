class MunchieSerializer

  def self.munchies_data(location, forecast, restaurant)
    {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": location,
          "forecast": {
            "summary": forecast.condition,
            "temperature": forecast.temperature
          },
          "restaurant": {
            "name": restaurant.name,
            "address": restaurant.address,
            "rating": restaurant.rating,
            "reviews": restaurant.reviews
          }
        }
      }
    }
  end
end