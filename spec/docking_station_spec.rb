require_relative "../lib/docking_station"

describe DockingStation do

  let (:station) {DockingStation.new(capacity: 20)}
  let (:bike) {double :bike}

  def fill_station
    20.times {station.dock(bike)}
  end

  it "should accept a bike" do

    expect(station.bikecount).to eq 0
    station.dock(bike)
    expect(station.bikecount).to eq 1
  end

  it "should release a bike" do

    station.dock(bike)
    station.release(bike)
    expect(station.bikecount).to eq 0
  end

  it "should know when it's full" do

    expect(station).not_to be_full
    fill_station
    expect(station).to be_full
  end

  it "should not accept a bike if it's full" do

    fill_station
    expect{station.dock(bike)}.to raise_error
  end

  it "should provide the list of available bikes" do
    broken_bike = double :bike, broken?: true
    working_bike = double :bike, broken?: false
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.available_bikes.count).to eq (1)
  end



end