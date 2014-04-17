class Person

  def initialize(bike = nil)
    @bike = bike
  end

  def has_bike?
    !@bike.nil?
  end

  def crash(bike)
    bike.break!
  end

  def rent(bike_from, station)
    station.release(bike_from)
    @bike = true
  end

  def dock(bike, station)
    station.dock(bike)
    @bike = nil
  end
end