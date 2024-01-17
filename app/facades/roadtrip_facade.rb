class RoadtripFacade
  def self.get_roadtrip(origin, destination)
    directions = MapquestService.get_directions(origin, destination)
    time = directions[:route][:formattedTime]
    Trip.new(origin, destination, time)
  end
end