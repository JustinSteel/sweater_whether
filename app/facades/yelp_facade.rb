class YelpFacade
  def self.get_restaurant(location, food)
    restaurant = YelpService.get_restaurant(location, food)
    results = restaurant[:businesses][0]
    Restaurant.new(results)
  end
end