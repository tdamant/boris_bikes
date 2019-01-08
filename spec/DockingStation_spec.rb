require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it "should return an instance of the Bike class when .release_bike method is called" do
    expect(subject.release_bike).to be_instance_of(Bike)
    expect(subject.release_bike.working?).to eq true
  end
  it {is_expected.to respond_to :dock}
  #when we call dock on a station, check the docked_bikes array is not empty
  it "should not return an empty array once .dock has been called" do
    expect(subject.dock(Bike.new)).to #not be empty!
  end
end
