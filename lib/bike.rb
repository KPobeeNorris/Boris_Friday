class Bike

  def initialize
    @broken = false
  end

  def broken?
    @broken
  end

  def report_bike_broken
    @broken = true
  end

end
