require 'docking_station'

describe DockingStation do

  it "Passing an interger to DockingStation.new should change the capacity of the docking station" do
    station = DockingStation.new(12)
    expect(station.capacity).to eq 12
  end

  it "If we don't pass an argument to DockingStation.new the capacity should = 20" do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "should return an instance of the Bike class when .release_bike method is called" do
    station = subject.dock(Bike.new)
    expect(station.release_bike).to be_instance_of(Bike)
  end

  it "bikes should be working when released" do
    station = subject.dock(Bike.new)
    expect(station.release_bike.condition).to eq true
  end

  it "docked_bikes should return a bike, if there is one" do
    bike = Bike.new
    station = subject.dock(bike)
    expect(station.docked_bikes.include?(bike)).to eq true
  end

  it 'throws an error when trying to release bike and no bikes in station' do
    expect{subject.release_bike}.to raise_error "no bikes"
  end

  it "the program won't allow us to add more bikes than the station has capacity for" do
    station = subject
    expect{ (station.capacity).times { station.dock(Bike.new) } }.to_not raise_error
    expect{ station.dock(Bike.new) }.to raise_error "dock is full"
  end

  it "the dock should not release a bike if it's broken" do
    bike = Bike.new
    station = subject.dock(bike.is_broken)
    expect{ station.release_bike }.to raise_error "bike is broken"
  end

end
