require 'docking_station'

describe DockingStation do

  before do
    @station = DockingStation.new
  end
  let(:bike) { double :bike }
  it "should respond to release bike" do
    expect(@station).to respond_to(:release_bike)
  end

  it "should not release a bike, if the docking station is empty" do
   expect { @station.release_bike }.to raise_error("There aren't any bikes!")
  end

  it "should not release a broken bike" do
    allow(bike).to receive(:report_bike_broken).and_return(true)
    allow(bike).to receive(:broken?).and_return(true)
    @station.dock_bike(bike)
    expect {@station.release_bike}.to raise_error("Unable to release as broken")
  end

  it "should accept a broken bike" do
    allow(bike).to receive(:report_bike_broken).and_return(true)
    expect(@station.dock_bike(bike).last).to eq bike
  end

  it "should respond to docking bike" do
    expect(@station).to respond_to(:dock_bike)
  end

  it "should not dock a bike if station is full" do
    DockingStation::DEFAULT_CAPACITY.times{@station.dock_bike(bike)}
    expect { @station.dock_bike(bike) }.to raise_error("There is no room to dock the bike!")
  end

  it "should see that a working bike has been docked" do
    @station.dock_bike(bike)
    expect(@station.dock_bike(bike).last).to eq bike
  end

  it "should be able to accept default number of bikes" do
    DockingStation::DEFAULT_CAPACITY.times {@station.dock_bike(bike)}
    expect(@station.bikes.length).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "should have a maximum capacity" do
    expect(@station).to respond_to(:capacity)
  end

  it "should have a default capacity of 20 when no capacity is given" do
    expect(@station.capacity).to eq 20
  end

  it "should have a capacity of 10 when given 10" do
    station = DockingStation.new(10)
    expect(station.capacity).to eq 10
  end

end
