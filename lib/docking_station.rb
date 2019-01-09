require_relative 'bike'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    !empty? ? @docked_bikes.pop : fail("no bikes")
  end

  def dock(bike)
    !full? ? @docked_bikes << bike : fail("dock is full")
    self
  end

  private

  def full?
    @docked_bikes.length == 20
  end

  def empty?
    @docked_bikes.length == 0
  end

end
