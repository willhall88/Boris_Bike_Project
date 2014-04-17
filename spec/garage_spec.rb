require "garage"
require 'bike_container_spec'

describe Garage do

  it_behaves_like BikeContainer 

  it "should be able to fix broken bikes" do
    
    garage = Garage.new
    bike = double :bike, broken?: false
    broken_bike = double :bike, broken?: true

    garage.dock(bike)
    garage.dock(broken_bike)
    
    expect(bike).not_to receive(:fix!)
    expect(broken_bike).to receive(:fix!)

    garage.fix_bikes

  end
  
end