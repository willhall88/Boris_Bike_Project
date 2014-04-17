require "van"
require "bike_container_spec"

describe Van do

  let (:van)     {Van.new(capacity:5)}
  let (:station) { double :station, release_broken_bike: :broken_bike }
  
  it_behaves_like BikeContainer

end