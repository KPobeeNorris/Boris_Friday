require 'docking_station'

describe DockingStation do

  before do
    @station = DockingStation.new
  end

  it "should respond to release bike" do
    expect(@station).to respond_to(:release_bike)
  end

  it "should not release a bike, if the docking station is empty" do
   expect { @station.release_bike }.to raise_error("There aren't any bikes!")
  end

  it "should respond to docking bike" do
    expect(@station).to respond_to(:dock_bike)
  end

  it "should not dock a bike if station is full" do
    DockingStation::DEFAULT_CAPACITY.times{@station.dock_bike(Bike.new)}
    expect { @station.dock_bike(Bike.new) }.to raise_error("There is no room to dock the bike!")
  end

  it "should return a working bike" do
    bike = Bike.new
    expect(bike.working?).to eq (true)
  end

#   it "should allow a bike to be docked" do
#     bike = Bike.new
#     expect(bike.dock_bike).to eq (true)
# end

  it "should see that a bike has been docked" do
    bike = Bike.new
    @station.dock_bike(bike)
    expect(@station.bikes).to eq [bike]
  end

  it "should be able to accept default number of bikes" do
    DockingStation::DEFAULT_CAPACITY.times {@station.dock_bike(Bike.new)}
    expect(@station.bikes.length).to eq DockingStation::DEFAULT_CAPACITY

    end


end
