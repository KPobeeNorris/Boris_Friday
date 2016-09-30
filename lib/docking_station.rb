require_relative 'bike.rb'

class DockingStation

  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There aren't any bikes!" if empty?
    bike = @bikes.pop
    raise "Unable to release as broken" if bike.broken?
    bike
  end

  def dock_bike(bike)
    raise "There is no room to dock the bike!" if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count == DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end
