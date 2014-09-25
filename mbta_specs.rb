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
      trip = {
        origin: {
          line: :red,
          stop: 'Alewife'
        },
        destination: {
          line: :red,
          stop: 'Harvard'
        }
      }
      expect(@mbta.distance(trip)).to eq 3
    end

    it "can find the distance between two stops on different lines" do
      trip = {
        origin: {
          line: :red,
          stop: 'Alewife'
        },
        destination: {
          line: :green,
          stop: 'Boylston'
        }
      }
      expect(@mbta.distance(trip)).to eq 7
    end

    it "gives the correct distance when starts and ends at same stop" do
      trip = {
        origin: {
          line: :red,
          stop: 'Park Street'
        },
        destination: {
          line: :green,
          stop: 'Park Street'
        }
      }
      expect(@mbta.distance(trip)).to eq 0
    end
  end
end