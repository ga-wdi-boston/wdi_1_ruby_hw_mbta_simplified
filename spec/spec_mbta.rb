require_relative '../mbta.rb'

RSpec.describe '#distance_same_line' do
  it 'returns the number of stops from origin stop to final stop on the same line' do
    expect(distance_same_line("greenline", "haymarket", "boylston")).to eq (3)
    expect(distance_same_line("redline", "alewife", "central")).to eq (4)
    expect(distance_same_line("orangeline", "tufts medical center", "haymarket")).to eq (5)
  end
end


RSpec.describe '#distance_other_line' do
  it 'returns the number of stops from origin stop to final stop on the same line' do
    expect(distance_other_line("greenline", "redline", "haymarket", "harvard")).to eq (5)
    expect(distance_other_line("redline", "orangeline", "alewife", "state street")).to eq (7)
    expect(distance_other_line("orangeline", "greenline", "tufts medical center", "haymarket")).to eq (6)
  end
end
