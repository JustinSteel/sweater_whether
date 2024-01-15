require 'rails_helper'

RSpec.describe YelpService do
  describe 'Class Methods' do
    context '#get_restaurant', :vcr do
      it 'returns restaurant after being provided destination and typy of food' do
        restaurant = YelpService.get_restaurant('denver,co', 'mexican')
        
        expect(restaurant).to be_a(Hash)
        expect(restaurant[:businesses]).to be_an(Array)
      end

      it 'has the needed location and food Data' do
        location = YelpService.get_restaurant('denver,co', 'mexican')
        location_data = location[:businesses][0][:location][:display_address].join(", ")
        food_data = location[:businesses][0][:categories][0][:title]

        expect(location_data).to be_an(String)
        expect(location_data).to be_a(String)
        expect(location_data).to eq("4978 Leetsdale Dr, Denver, CO 80246")

        expect(food_data).to be_a(String)
        expect(food_data).to eq("Mexican")
        expect(food_data).to_not eq("Italian")
      end
    end
  end
end