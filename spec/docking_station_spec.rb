require "docking_station"

describe DockingStation do
  it_should_behave_like BikeContainer
  
  let (:station) {DockingStation.new(capacity: 123)}

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

  it "should list broken bikes" do
    working_bike = double :bike, broken?: false
    broken_bike = double :bike, broken?: true

    station.dock(working_bike)
    2.times {station.dock(broken_bike)}
    expect(station.broken_bikes.count).to eq 2
  end



end