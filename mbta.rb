def method(start_line, finish_line, start_stop, finish_stop)
mbta = {
  red_line: {
    alewife: 6,
    davis: 5,
    porter: 4,
    harvard: 3,
    central: 2,
    kendall: 1,
    park_street: 0,
    south_station: -1
  },
  green_line: {
    haymarket: 2,
    government_center: 1,
    park_street: 0,
    boylston: -1,
    arlington: -2,
    copley: -3
  },
  orange_line: {
    north_station: 2,
    haymarket: 1,
    park_street: 0,
    state_street: -1,
    downtown_crossing: -2,
    chinatown: -3,
    tufts_medical_center: -4
  }
}

  if mbta[start_line] == mbta[finish_line]
    mbta[start_stop] - mbta[finish_stop]
  elsif mbta[start_line] != mbta[finish_line]
    mbta[start_stop] - mbta[finish_stop]
  end

end

puts "What line do you want to start on?"
origin_line = gets.chomp.to_sym
puts "Starting station?"
origin_stop = mbta[:red_line][:alewife]

puts "What is your destination line"
destination_line = mbta[:orange_line]
puts "Destination station"
destination_stop = mbta[:orange_line][:tufts_medical_center]

puts method(origin_line, destination_line, origin_stop, destination_stop)


