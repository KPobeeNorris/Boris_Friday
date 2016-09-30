require_relative 'bike.rb'

class DockingStation
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def release_bike

    if @bikes.length > 0
      @bikes.pop
    else
      raise "There aren't any bikes!"
    end
  end

  def dock_bike(bike)
    if @bikes.length < 20
      @bikes << bike
    else
      raise "There is no room to dock the bike!"
    end
  end
end

# ds = DockingStation.new
# bike = Bike.new
#
# # puts ds.release_bike
