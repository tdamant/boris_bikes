require 'van'

describe Van do
  let(:working_bike) { double(:condition => true) }
  let(:broken_bike) { double(:condition => false) }
  let(:station) { double(:docked_bikes => [working_bike, broken_bike], :release_broken_bikes => [broken_bike])}
  let(:garage) { double :garage }

  it "can load broken bikes from docking stations" do
    expect(subject).to respond_to :pick_up_bikes
  end

  it "calling the pick_up_bikes method will load the van with broken bikes" do
    van = subject.pick_up_bikes(station)
    expect(van.bikes_in_van).to eq([broken_bike])
  end

  it "can drop off broken bikes at a garage" do
    van = subject.pick_up_bikes(station)
    expect(van.drop_off_bikes(garage).bikes_in_van ).to eq([])
  end

end
