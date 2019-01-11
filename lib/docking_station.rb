# require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :docked_bikes , :capacity, :DEFAULT_CAPACITY

  def initialize(capacity=DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity= capacity
  end

  def release_broken_bikes
    bikes_released = @docked_bikes.select {|bike| !bike.condition }
    bikes_released.each{|bike| @docked_bikes.delete(bike)}
    bikes_released
  end

  def release_bike
    empty?
    last_is_broken?
    @docked_bikes.pop
  end

  def dock(bike)
    full?
    @docked_bikes << bike
    self
  end

  private

  def full?
    fail("dock is full") if @docked_bikes.length == @capacity
  end

  def last_is_broken?
    fail("bike is broken") if !@docked_bikes[-1].condition
  end

  def empty?
    fail("no bikes") if @docked_bikes.length == 0
  end

end
