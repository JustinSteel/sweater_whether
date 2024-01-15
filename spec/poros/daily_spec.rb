require 'rails_helper'

RSpec.describe Daily do
  it 'exists' do
    attributes = {
      date: '10-10-2023',
      astro: {
        sunset: '12:12',
        sunrise: '12:12'
      },
      day: {
        maxtemp_f: 106.3,
        mintemp_f: 32.2,
        condition: {
          text: 'sunny',
          icon: 'someicon.png'
        }
      }      
    }

    daily_weather = Daily.new(attributes)
  
    expect(daily_weather).to be_a(Daily)
    expect(daily_weather.date).to eq('10-10-2023')
    expect(daily_weather.sunrise).to eq('12:12')
    expect(daily_weather.sunset).to eq('12:12')
    expect(daily_weather.max_temp).to eq(106.3)
    expect(daily_weather.min_temp).to eq(32.2)
    expect(daily_weather.condition).to eq('sunny')
    expect(daily_weather.icon).to eq('someicon.png')
  end
end