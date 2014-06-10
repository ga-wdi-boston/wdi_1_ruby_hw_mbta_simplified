metro = {
  red:  %w(alewife davis porter harvard central kendall park south),
  green: %w(haymarket government park boylston arlington copley),
  orange: %w(north haymarket park state downtown chinatown tufts),
  intersection: "park"
}


start_line = :unset
end_line = :unset
start_station = :unset
end_station = :unset
distance = -1

until metro[start_line]
puts "Enter your starting line ('red', 'green', or 'orange'):"
start_line = gets.chomp.downcase.to_sym
end

until metro[start_line].index(start_station)
  puts "Enter your start station (#{metro[start_line]} are the stations):"
  start_station = gets.chomp.downcase
end


until metro[end_line]
puts "Enter your destination line ('red', 'green', or 'orange'):"
end_line = gets.chomp.downcase.to_sym
end

until metro[end_line].index(end_station)
  puts "Enter your destination station (#{metro[end_line]} are the stations):"
  end_station = gets.chomp.downcase
end

# If start-line and end-line are the same
if start_line == end_line
  distance = (metro[start_line].index(start_station) - metro[start_line].index(end_station)).abs
else
  # handle crossing to a different start_line
  distance_to_park = (metro[start_line].index(start_station) - metro[start_line].index(metro[:intersection])).abs
  distance_from_park = (metro[end_line].index(end_station) - metro[end_line].index(metro[:intersection])).abs
  distance = distance_to_park + distance_from_park
end

puts "#{distance} stops"
