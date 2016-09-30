require_relative 'bike.rb'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def release_bike
    raise "There aren't any bikes!" if empty?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "There is no room to dock the bike!" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count == 20
  end

  def empty?
    @bikes.empty?
  end

end

# ds = DockingStation.new
# bike = Bike.new
#
# # puts ds.release_bike
