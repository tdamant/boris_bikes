require 'docking_station'

describe DockingStation do
  it "should return an instance of the Bike class when .release_bike method is called" do
    expect(subject.release_bike).to be_instance_of(Bike)
    expect(subject.release_bike.working?).to eq true
  end
  #when we call dock on a station, check the docked_bikes array is not empty
  it "docked_bikes should return a bike, if there is one" do
    station = DockingStation.new
    bike = Bike.new
    expect(station.dock(bike).docked_bikes.include?(bike)).to eq true
  end
end
