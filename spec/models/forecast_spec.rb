require 'rails_helper'

RSpec.describe Forecast, type: :model do

  describe 'class methods' do
    describe '.location_present' do 
      it ' will raise an error if no location is put in' do 
        expect(Forecast.location_present("houston")).to eq("houston")

        expect { Forecast.location_present("") }.to raise_error( ActiveRecord::StatementInvalid)
      end
    end
  end
end