require_relative 'mbta'

describe MBTA do

  before(:all) do
    @mbta = MBTA.new
    @test_trip = {
      origin: {
        line: :red,
        stop: 'Alewife'
      },
      destination: {
        line: :red,
        stop: 'Alewife'
      }
    }
  end

  it "has the subway system defined with appropriate data structures" do
    expect(@mbta.stops[:red].is_a?(Array)).to be true
  end

  describe "#trip" do
    it "takes stops and lines and creates a trip hash" do
      expect(@mbta.trip([:red, 'Alewife', :red, 'Alewife'])).to eq @test_trip
    end
  end

  describe "#distance" do
    it "can find the distance between two stops on the same line" do
      trip = @mbta.trip([:red, "Alewife", :red, "Harvard"])
      expect(@mbta.distance(trip)).to eq 3
    end

    it "can find the distance between two stops on different lines" do
      trip = @mbta.trip([:red, "Alewife", :green, "Boylston"])
      expect(@mbta.distance(trip)).to eq 7
    end

    it "gives the correct distance when starts and ends at same stop" do
      trip = @mbta.trip([:red, "Park Street", :green, "Park Street"])
      expect(@mbta.distance(trip)).to eq 0
    end
  end
end