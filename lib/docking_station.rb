require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :docked_bikes , :capacity, :DEFAULT_CAPACITY

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity= capacity
  end

  def release_bike
    if empty?
      fail("no bikes")
    elsif !@docked_bikes[-1].condition
      fail("bike is broken")
    else
      @docked_bikes.pop
    end
  end

  def dock(bike, condition=true)
    !full? ? @docked_bikes << bike : fail("dock is full")
    bike.condition = condition
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
