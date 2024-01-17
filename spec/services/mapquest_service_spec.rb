require 'rails_helper'

RSpec.describe MapquestService do
  describe 'Class Methods' do
    context '#get_coordinates', :vcr do
      it 'returns geolocation information after getting an address' do
        location = MapquestService.get_coordinates('denver,co')
        
        expect(location).to be_a(Hash)
        expect(location[:results]).to be_an(Array)
      end

      it 'has the needed location Data' do
        location = MapquestService.get_coordinates('denver,co')
        location_data = location[:results].first[:locations].first

        expect(location_data).to have_key(:latLng)
        expect(location_data[:latLng]).to be_a(Hash)

        expect(location_data[:latLng]).to have_key(:lat)
        expect(location_data[:latLng][:lat]).to be_a(Float)

        expect(location_data[:latLng]).to have_key(:lng)
        expect(location_data[:latLng][:lng]).to be_a(Float)
      end

      it 'returns directions information after getting an address' do
        origin = 'Denver,CO'
        destination = 'Pueblo,CO'

        response = MapquestService.get_directions(origin, destination)

        expect(response).to be_a(Hash)
        expect(response).to have_key(:route)
        expect(response[:route]).to have_key(:formattedTime)
        expect(response[:route][:formattedTime]).to be_a(String)
      end
    end
  end
end
