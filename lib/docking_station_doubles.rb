class DockingStationDoubles
  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def bikecount
    @bikes.count
  end

  def dock(bike)
    raise "station is full!" if full?
    @bikes << bike
  end

  def release(bike)
    @bikes.delete(bike)
  end

  def full?
    bikecount == @capacity
  end

  def available_bikes
    @bikes.reject {|bike| bike.broken?(true)}
  end
end