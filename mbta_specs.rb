require_relative 'mbta'

describe MBTA do

  before(:all) do
    @mbta = MBTA.new
  end

  it "has the subway system defined with appropriate data structures" do
    expect(@mbta.stops[:red].is_a?(Array)).to be true
  end

  describe "#distance" do
    it "can find the distance between two stops on the same line" do
      expect(@mbta.distance([:red, 'Alewife'],[:red, 'Harvard'])).to eq 3
    end

    it "can find the distance between two stops on different lines" do
      expect(@mbta.distance([:red, 'Alewife'],[:green, 'Boylston'])).to eq 7
    end

    it "gives the correct distance when starts and ends at same stop" do
      expect(@mbta.distance([:red, 'Park Street'], [:green, 'Park Street'])).to eq 0
    end
  end
end