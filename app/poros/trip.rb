class Trip
  attr_reader :origin, :destination, :travel_time, :date_time, :hour

  def initialize(origin, destination, time)
    @origin = origin
    @destination = destination
    @travel_time = travel_time?(time) 
    @date_time = format_time(time)
    @hour = format_hour(time)
  end

  def format_time(time)
    time = Time.now + time.to_i.hours
    time.to_s.slice(0..15)
  end

  def format_hour(time)
    time = Time.now + time.to_i.hours
    time.to_s.slice(11..15)
  end

  def travel_time?(time)
    time.nil? ? "Impossible" : time
  end
end