require 'bike'
require 'docking_station.rb'
describe Bike do

  it 'does the bike have a condition attribute?' do
    expect(subject).to respond_to(:condition)
  end

  it "condition should equal the condition passed to DockingStation.dock method" do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike, false)
    expect(bike.condition).to eq false
  end

end
