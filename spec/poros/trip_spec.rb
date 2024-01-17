require "rails_helper"

RSpec.describe Trip do
  it "exists" do
    origin = "Houston,TX"
    destination = "Denver,CO"
    time = "20:00:00"
    now = Time.parse("2024-01-17 11:31")
    allow(Time).to receive(:now) { now }

    trip = Trip.new(origin, destination, time)


    expect(trip).to be_a(Trip)
    expect(trip.origin).to eq("Houston,TX")
    expect(trip.destination).to eq("Denver,CO")
    expect(trip.travel_time).to eq("20:00:00")
    expect(trip.date_time).to eq("2024-01-18 07:31")
    expect(trip.hour).to eq("07:31")
    expect(trip.travel_time?("20:00:00")).to eq("20:00:00")

    expect(trip.travel_time?(nil)).to eq("Impossible")
    expect(trip.format_time("2021-08-09 20:00:00 -0600")).to eq("2024-04-10 17:31")
    expect(trip.format_hour("2021-08-09 20:00:00 -0600")).to eq("17:31")
  end
end