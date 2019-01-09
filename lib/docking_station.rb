require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :docked_bikes , :capacity, :DEFAULT_CAPACITY

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity= capacity
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
    @docked_bikes.length == @capacity
  end

  def empty?
    @docked_bikes.length == 0
  end

end
