require 'docking_station'

describe DockingStation do
  it {is_expected.to respond_to :release_bike}
  it "should return an instance of the Bike class when .release_bike method is called" do
    expect(subject.release_bike).to be_instance_of(Bike)
    expect(subject.release_bike.working?).to eq true
  end
end
