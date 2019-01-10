require 'docking_station'

describe DockingStation do

  let(:working_bike) { double(:condition => true) }
  let(:broken_bike) { double(:condition => false) }

  it "Passing an interger to DockingStation.new should change the capacity of the docking station" do
    expect(DockingStation.new(12).capacity).to eq 12
  end

  it "If we don't pass an argument to DockingStation.new the capacity should = 20" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "should return an instance of the Bike class when .release_bike method is called" do
    expect(subject.dock(working_bike).release_bike).to be_instance_of(working_bike.class)
  end

  it "bikes should be working when released" do
    expect(subject.dock(working_bike).release_bike.condition).to eq true
  end

  it "docked_bikes should return a bike, if there is one" do
    expect(subject.dock(working_bike).docked_bikes.include?(working_bike)).to eq true
  end

  it 'throws an error when trying to release bike and no bikes in station' do
    expect{subject.release_bike}.to raise_error "no bikes"
  end

  it "the program won't allow us to add more bikes than the station has capacity for" do
    expect{ (subject.capacity).times { subject.dock(working_bike) } }.to_not raise_error
    expect{ subject.dock(working_bike) }.to raise_error "dock is full"
  end

  it "the dock should not release a bike if it's broken" do
    expect{ subject.dock(broken_bike).release_bike }.to raise_error "bike is broken"
  end

end
