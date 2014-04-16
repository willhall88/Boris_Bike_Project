require_relative "bike_container"

class Van
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end
      
  def collect_bikes_from(station)
    return if self.full?
      self.dock(station.release_broken_bike)
      collect_bikes_from(station)
  end

end