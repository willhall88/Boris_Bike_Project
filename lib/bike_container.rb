module BikeContainer

  DEFAULT_CAPACITY = 3

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
    self.broken_bikes.each {|bike| self.release(bike)}
  end

  def release_fixed_bikes
    self.available_bikes.each {|bike| self.release(bike)}
  end

  def collect(bikes)
    
  end

  def collect_broken_bikes_from(place)
    place.broken_bikes.each do
      |bike| if !self.full?
        self.dock(bike) 
        place.release(bike)
      end
    end
  end

  def collect_fixed_bikes_from(place)
    place.available_bikes.each do
      |bike| if !self.full?
        self.dock(bike)
        place.release(bike)
      end
    end
  end


end