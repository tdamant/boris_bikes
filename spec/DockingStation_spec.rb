require 'docking_station'

describe DockingStation do
  it "should return an instance of the Bike class when .release_bike method is called" do
    subject.dock(Bike.new)
    expect(subject.release_bike).to be_instance_of(Bike)
    subject.dock(Bike.new)
    expect(subject.release_bike.working?).to eq true
  end
  #when we call dock on a station, check the docked_bikes array is not empty
  it "docked_bikes should return a bike, if there is one" do
    bike = Bike.new
    station = DockingStation.new.dock(bike)
    expect(station.docked_bikes.include?(bike)).to eq true
  end

  it 'throws an error if no bikes in station' do
    expect{subject.release_bike}.to raise_error "no bikes"
  end



end
