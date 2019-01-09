require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    if !@docked_bikes.empty?
    @docked_bikes.pop
  else
    fail "no bikes"
  end
  end

  def dock(bike)
    @docked_bikes << bike
    return self
  end

end
