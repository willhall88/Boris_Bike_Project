module BikeContainer

  DEFAULT_CAPACITY = 20

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise "Station is full" if full?
    bikes << bike
  end

  def release(bike)
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject {|bike| bike.broken?}
  end

  def broken_bikes
    bikes.select {|bike| bike.broken?}
  end

  def release_broken_bikes
    @bikes = bikes - broken_bikes
  end

  def release_fixed_bikes
    @bikes = bikes - available_bikes
  end

  def collect_broken_bikes_from(place)
    return if self.full?
    self.dock(place.release_broken_bikes)
    collect_broken_bikes_from(place)
  end

  def collect_fixed_bikes_from(place)
    return if self.full?
    self.dock(place.release_fixed_bikes)
    collect_fixed_bikes_from(place)
  end


end