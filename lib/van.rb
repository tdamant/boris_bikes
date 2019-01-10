require_relative 'docking_station'

class Van

  attr_reader :bikes_in_van

  def initialize
    @bikes_in_van = []
  end

  def pick_up_bikes(station)
    station.docked_bikes.each { |bike| @bikes_in_van << bike if !bike.condition }
    self
  end

  def drop_off_bikes(garage)
    @bikes_in_van = []
    self
  end

end
