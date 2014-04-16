require_relative "./bike_container"

class DockingStation

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end
  
  def broken_bikes
    bikes.select {|bike| bike.broken?}
  end

  def release_broken_bikes
    @bikes = bikes - broken_bikes
  end

end