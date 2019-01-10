require_relative 'docking_station'

class Van

  def pick_up_bikes(station)
    station.docked_bikes.select { |bike| !bike.condition }
  end

end
