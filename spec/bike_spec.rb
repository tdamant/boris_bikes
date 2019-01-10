require 'bike'
require 'docking_station.rb'

describe Bike do

  it "calling the is_broken method on a bike object will change that bike's condition to false" do
    expect(subject.is_broken.condition).to eq false
  end

end
