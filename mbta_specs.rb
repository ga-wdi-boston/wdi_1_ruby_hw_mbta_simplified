require 'mbta'

describe MBTA do

  before(:all) do
  end

  it "has the subway system defined with appropriate data structures" do
    expect(MBTA.stops[:red].is_a?(Array)).to be true
  end

  describe "#distance" do
    it "can find the distance between two stops on the same line" do
      expect(MBTA.distance([:red, 'Alewife'],[:red, 'Harvard'])).to eq 3
    end

    it "can find the distance between two stops on different lines" do
      expect(MBTA.distance([:red, 'Alewife'],[:red, 'Harvard'])).to eq 3
    end

    it "gives the correct distance when starts and ends at same stop" do
      expect(MBTA.distance([:red, 'Park Street'], [:green, 'Park Street'])).to eq 0
    end
  end
end