require "docking_station"

describe DockingStation do
  it_should_behave_like BikeContainer
  
  let (:station) {DockingStation.new(capacity: 123)}

  it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end



end