require "van"
require "bike_container_spec"

describe Van do

  let (:van)     {Van.new(capacity:5)}
  let (:station) { double :station, release_broken_bike: :broken_bike }
  
  it_behaves_like BikeContainer










  # it "releases fixed bikes to station" do
  #   station = double :station, :dock(bike)
  #   broken_bike    = double :bike, broken?: true

  #   3.times {van.dock(bike)}
  #   van.release_fixed_bike
  #   expect

  # end

end