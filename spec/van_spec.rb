require "van"
require "bike_container_spec"

describe Van do

  let (:van) {Van.new(capacity:5)}
  it_behaves_like BikeContainer

  it "collects all broken bikes up to capacity" do
    station = double :station, release_broken_bike: :broken_bike

    van.collect_bikes_from(station)
    expect{van.dock(station.release_broken_bike)}.to raise_error(RuntimeError)
  end

end