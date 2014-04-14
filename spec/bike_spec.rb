require "bike"

describe Bike do
	it "should not be broken after we create it"do
    bike = Bike.new
    expect(bike).to_not be_broken
  end
	


end