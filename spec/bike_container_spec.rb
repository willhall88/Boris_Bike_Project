require "bike_container"

shared_examples BikeContainer do
  
  let(:holder)      { described_class.new          }
  let(:bike)        { double :bike, broken?: false }
  let(:broken_bike) { double :bike, broken?: true  }
  let (:place) { double :place, release_broken_bikes: :broken_bike, release_fixed_bikes: :bike }

  def fill_holder
    20.times {holder.dock(bike)}
  end

  it "should accept a bike" do
    expect(holder.bike_count).to eq 0
    holder.dock(bike)
    expect(holder.bike_count).to eq 1
  end  

  it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq 0
  end

  it "should know when it's full" do
    expect(holder).not_to be_full
    fill_holder
    expect(holder).to be_full
  end

  it "should not accept a bike if it's full" do
    fill_holder
    expect{holder.dock(bike)}.to raise_error
  end

  it "should provide the list of available bikes" do
    holder.dock(bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes.count).to eq 1
  end

  it "should list broken bikes" do
    holder.dock(bike)
    2.times {holder.dock(broken_bike)}
    expect(holder.broken_bikes.count).to eq 2
  end

  it "should be able to release broken bikes" do
    holder.dock(bike)
    2.times {holder.dock(broken_bike)}
    holder.release_broken_bikes
    expect(holder.bike_count).to eq 1
  end

  it "should release fixed bikes" do
    holder.dock(bike)
    2.times {holder.dock(broken_bike)}
    holder.release_fixed_bikes
    expect(holder.bike_count).to eq 2
  end

  it "collects all broken bikes up to capacity" do
    holder.collect_broken_bikes_from(place)
    expect{holder.dock(place.release_broken_bikes)}.to raise_error(RuntimeError)
  end

  it "collects all fixed bikes up to a capacity" do
    holder.collect_fixed_bikes_from(place)
    expect{holder.dock(place.release_fixed_bikes)}.to raise_error(RuntimeError)
  end








end