require_relative '../lib/mbta.rb'


RSpec.describe 'mbta' do
  describe '#number_of_stops'do
    it 'returns the proper number of stops between stations on one line' do
      expect(number_of_stops(first_line: :red_line,
                            origin: :central,
                            second_line: :red_line,
                            destination: :harvard )).to be 1
      expect(number_of_stops(first_line: :red_line,
                            origin: :kendall,
                            second_line: :red_line,
                            destination: :harvard )).to be 2
    end

    it 'returns the number of stops between stations on multiple lines' do



    end

  end
end
