#Method to check if the line is an actual line
def line_check(subway, line)
  line_exists = subway.key?(line)
  if !line_exists
    puts "That's not a valid line"
    puts "Select orange, red or green"
    line = (gets.chomp.downcase << '_line').to_sym
    line = line_check(subway, line)
  else
    line
  end
end

#Method to check if stop exists
def station_check(subway, line, stop)
  station_exists = subway[line].include?(stop)

  if !station_exists
    puts "That is not a valid station"
    puts "Please select a valid station"
    stop = gets.chomp.downcase
    stop = station_check(subway, line, stop)
  else
    stop
  end
end

# Initial data structure for subway system

subway = {
  green_line: ['haymarket', 'government center', 'park street', 'boylston', 'arlington', 'copley'],
  red_line: ['alewife', 'davis', 'porter', 'harvard', 'central', 'kendall/mit', 'park street', 'south station'],
  orange_line: ['north station', 'haymarket', 'park street', 'state street', 'downtown crossing', 'chinatown', 'tufts medical center']
}

#User input for origin and destination (stop and line)
puts "Select origin line: (green, red, or orange)"
origin_line = (gets.chomp.downcase << '_line').to_sym
origin_line = line_check(subway, origin_line)

puts
puts "Here are the stations for the #{origin_line}"
puts
puts subway[origin_line]
puts
puts "Select origin stop: "
origin_stop = gets.chomp.downcase
origin_stop = station_check(subway, origin_line, origin_stop)

puts
puts "Select destination line: (green, red, or orange)"
destination_line = (gets.chomp.downcase << '_line').to_sym
destination_line = line_check(subway, destination_line)

puts
puts "Here are the stations for the #{destination_line}"
puts
puts subway[destination_line]
puts
puts "Select destination stop: "
destination_stop = gets.chomp.downcase
destination_stop = station_check(subway, destination_line, destination_stop)

#Manually set intersection stop

intersection_stop = "park street"

# Calculation for distance between stops on different lines with intersection stop
if origin_line != destination_line
  distance_origin_line = (subway[origin_line].index(intersection_stop) - subway[origin_line].index(origin_stop)).abs
  distance_destination_line = (subway[destination_line].index(intersection_stop) - subway[destination_line].index(destination_stop)).abs
  num_stops = distance_origin_line + distance_destination_line
else
  num_stops = (subway[destination_line].index(destination_stop) - subway[origin_line].index(origin_stop)).abs
end

puts
puts "Your journey will take #{num_stops} stops"

