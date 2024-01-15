class Forecast
  attr_reader :id, :location, :forecast_data

  def initialize(forecast_data, location)
    @id = nil
    @location = location
    @forecast_data = forecast_data
  end

  def current_weather
    require 'pry'; binding.pry
    current = forecast_data[:current]
    {
      last_updated: Time.at(current[:last_updated]),
      temperature: current[:temp_f],
      feels_like: current[:feelslike_f],
      humidity: current[:humidity],
      uvi: current[:uv],
      visibility: current[:vis_miles],
      conditions: current[:condition][:text],
      icon: current[:contition][:icon]
    }
  end

  def daily_weather
    daily = forecast_data[:forecast][:forecastday]
    daily[0..4].map do |day|
      {
        date: Time.at(day[:date]),
        sunrise: Time.at(day[:astro][:sunrise]),
        sunset: Time.at(day[:astro][:sunset]),
        max_temp: day[:day][:maxtemp_f],
        min_temp: day[:day][:mintemp_f],
        conditions: day[:day][:condition][:text],
        icon: day[:day][:condition][:icon]
      }
    end
  end

  def hourly_weather
    hourly = forecast_data[:forecast][:forecastday][:hour]
    hourly[0..7].map do |hour|
      {
        time: Time.at(hour[:time]),
        temperature: hour[:temp_f],
        conditions: hour[:condition][:text],
        icon: hour[:condition][:icon]
      }
    end
  end
end