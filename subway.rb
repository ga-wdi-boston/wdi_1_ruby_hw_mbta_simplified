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

puts "Select origin stop: "
origin_stop = gets.chomp.downcase

puts "Select destination stop: "
destination_stop = gets.chomp.downcase

puts "Select destination line: (green, red, or orange)"
destination_line = (gets.chomp.downcase << '_line').to_sym

#Manually set intersection stop

intersection_stop = "park street"

#Code to ensure the user input is correct



# Calculation for distance between stops on different lines with intersection stop
if origin_line != destination_line
  distance_origin_line = (subway[origin_line].index(intersection_stop) - subway[origin_line].index(origin_stop)).abs
  distance_destination_line = (subway[destination_line].index(intersection_stop) - subway[destination_line].index(destination_stop)).abs
  num_stops = distance_origin_line + distance_destination_line
else
  num_stops = (subway[destination_line].index(destination_stop) - subway[origin_line].index(origin_stop)).abs
end

puts num_stops
