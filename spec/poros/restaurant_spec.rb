require "rails_helper"

RSpec.describe Restaurant do
  it 'exists' do
    attributes = {
      name: 'Tacos Navarro',
      location: {
        display_address: ['223 E Northern Ave, Pueblo, CO 81006']
      },
      rating: 4.5, 
      review_count: 138
    }
    my_restaurant = Restaurant.new(attributes)
  
    expect(my_restaurant).to be_a(Restaurant)
    expect(my_restaurant.name).to eq('Tacos Navarro')
    expect(my_restaurant.address).to eq('223 E Northern Ave, Pueblo, CO 81006')
    expect(my_restaurant.rating).to eq(4.5)
    expect(my_restaurant.reviews).to eq(138)
  end
end