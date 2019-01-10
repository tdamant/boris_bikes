require 'van'

describe Van do
  let(:working_bike) { double(:condition => true) }
  let(:broken_bike) { double(:condition => false) }
  let(:station) { double(:docked_bikes => [working_bike, broken_bike])}

  it "can load broken bikes from docking stations" do
    expect(subject).to respond_to :pick_up_bikes
  end

  it "calling the pick_up_bikes method will load the van with broken bikes" do
    expect(subject.pick_up_bikes(station)).to eq([broken_bike])
  end
  
end
