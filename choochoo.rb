# Hashes reflect how many stops to get to park

red = {
    alewife: 6,
    davis: 5,
    porter: 4,
    harvard: 3,
    central: 2,
    kendall: 1,
    park: 0,
    south_station: -1,
}

green = {
    haymarket: 2,
    government: 1,
    park: 0,
    boylston: -1,
    arlington: -2,
    copley: -3
}

orange = {
    north: 2,
    haymarket: 1,
    park: 0,
    state: -1,
    downtown: -2,
    chinatown: -3,
    tufts: -4
}

line = {
    red: 0,
    green: 1,
    orange: 2
}

lines_array = [red, green, orange]

puts "Origin Stop? "
origin_stop = gets.chomp

puts "Origin Line? "
origin_line = gets.chomp

puts "Destination Stop? "
dest_stop = gets.chomp

puts "Destination Line? "
dest_line = gets.chomp

if origin_line == dest_line
  # Origin negative and destination negative
  if (lines_array[line[origin_line.to_sym]][origin_stop.to_sym] < 0) && (lines_array[line[dest_line.to_sym]][dest_stop.to_sym] < 0)
    total_stops = lines_array[line[origin_line.to_sym]][origin_stop.to_sym].abs - lines_array[line[dest_line.to_sym]][dest_stop.to_sym].abs
  # Origin negative but destination positive
  elsif (lines_array[line[origin_line.to_sym]][origin_stop.to_sym] < 0) && (lines_array[line[dest_line.to_sym]][dest_stop.to_sym] > 0)
    total_stops = lines_array[line[origin_line.to_sym]][origin_stop.to_sym].abs + lines_array[line[dest_line.to_sym]][dest_stop.to_sym]
  # Origin is positive and destination is positive or negative
  else
    total_stops = lines_array[line[origin_line.to_sym]][origin_stop.to_sym] - lines_array[line[dest_line.to_sym]][dest_stop.to_sym]
  end
# Switching lines so add stops to park on each line together
else
  total_stops = lines_array[line[origin_line.to_sym]][origin_stop.to_sym].abs + lines_array[line[dest_line.to_sym]][dest_stop.to_sym].abs
end

puts "Trip from #{origin_stop} on the #{origin_line} line going to #{dest_stop} on the #{dest_line} line"
puts "Total stops: #{total_stops}"

