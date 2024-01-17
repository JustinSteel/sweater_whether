class RoadtripSerializer
  def self.format_roadtrip(roadtrip, arrival_forecast)
    {
      data: {
        id: "null",
        type: "road_trip",
        attributes: {
          start_city: roadtrip.origin,
          end_city: roadtrip.destination,
          travel_time: roadtrip.travel_time,
          weather_at_eta: if roadtrip.travel_time != "Impossible"
                            {
                              datetime: roadtrip.date_time,
                              temperature: arrival_forecast.temperature,
                              condition: arrival_forecast.condition
                            }
                          else
                            " "
                          end
        }
      }
    }
  end
end
