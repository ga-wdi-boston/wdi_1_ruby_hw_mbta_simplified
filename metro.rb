# Jake AUstin
# GA WDI Boston June 2014
# hw 2
# June 10, 2014

# Define the metro as a hash of line => stations
# include intersection for modifying
metro = {
  red:  %w(alewife davis porter harvard central kendall park south),
  green: %w(haymarket government park boylston arlington copley),
  orange: %w(north haymarket park state downtown chinatown tufts),
  intersection: "park"
}

# initialize variables for user input
start_line = :unset
end_line = :unset
start_station = :unset
end_station = :unset
distance = -1

# get start line
until metro[start_line]
puts "Enter your starting line ('red', 'green', or 'orange'):"
start_line = gets.chomp.downcase.to_sym
end

# get start_station
until metro[start_line].index(start_station)
  puts "Enter your start station (#{metro[start_line]} are the stations):"
  start_station = gets.chomp.downcase
end

# get end_line
until metro[end_line]
puts "Enter your destination line ('red', 'green', or 'orange'):"
end_line = gets.chomp.downcase.to_sym
end

# get end_station
until metro[end_line].index(end_station)
  puts "Enter your destination station (#{metro[end_line]} are the stations):"
  end_station = gets.chomp.downcase
end

# Use the indexes of arrays of stops to calculate distance
if start_line == end_line
  # If start-line and end-line are the same
  distance = (metro[start_line].index(start_station) - metro[start_line].index(end_station)).abs
else
  # handle crossing to a different start_line
  distance_to_intersection = (metro[start_line].index(start_station) - metro[start_line].index(metro[:intersection])).abs
  distance_from_intersection = (metro[end_line].index(end_station) - metro[end_line].index(metro[:intersection])).abs
  distance = distance_to_intersection + distance_from_intersection
end

puts "#{distance} stops"
