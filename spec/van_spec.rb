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

  # it "releases fixed bikes to station " do
  #   station = double :station, release_broken_bike: :broken_bike

  #   van.release_fixed_bikes_to(station)
  #   expect{station.dock(van.release_fixed_bikes)}.to 
  # end








  # it "releases fixed bikes to station" do
  #   station = double :station, :dock(bike)
  #   broken_bike    = double :bike, broken?: true

  #   3.times {van.dock(bike)}
  #   van.release_fixed_bike
  #   expect

  # end

end