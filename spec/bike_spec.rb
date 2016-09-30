require 'bike'

describe Bike do

  before do
  @bike = Bike.new
  end

  it { is_expected.to respond_to :broken? }

  it { is_expected. to respond_to :report_bike_broken }

  it "should check that a new bike isn't broken" do
    expect(@bike.broken?).to eq false
  end


  it "should check that the bike is broken, if it's been reported" do
    @bike.report_bike_broken
    expect(@bike.broken?).to eq true
    end

end
