require "person"

describe Person do
  let(:person) {Person.new}
  let(:bike) {double :bike}
  let(:station) {double :station, dock: false, release: :bike}

  it"should not have a bike to begin with" do
    expect(person).not_to have_bike
  end

  it "can have a bike" do
    person = Person.new(:bike)
    
    expect(person).to have_bike
  end

  it "can crash" do
    expect(bike).to receive(:crash!)

    person.crash(bike)
  end

  it "can release a bike from a docking station" do

    expect(station).to receive(:release)
    person.rent(bike, station)
  end

  it"has a bike once it has rent one" do

    person.rent(bike, station)
    expect(person).to have_bike
  end

  it "can dock a bike" do
    expect(station).to receive(:dock)
    person.dock(bike, station)
  end

  it "doesn't have a bike after docking" do
    person.rent(bike, station)
    person.dock(bike, station)
    expect(person).not_to have_bike
  end


end