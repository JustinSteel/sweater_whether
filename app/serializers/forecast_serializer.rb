class ForecastSerializer
  include JSONAPI::Serializer
  set_id { nil }
  attributes :location, :current_weather, :daily_weather, :hourly_weather
  require 'pry'; binding.pry
end