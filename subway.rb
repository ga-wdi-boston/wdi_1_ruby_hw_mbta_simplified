def check_station(station, line, subway)
  station_exists = subway[line].include?(station)

  if !station_exists
    puts
    puts "That station does not exist on the #{line} line."
    puts "The #{line} line stations are:"
    puts subway[line]
    puts
    puts "Please select a new station:"
    station = gets.chomp.downcase
    station = check_station(station, line, subway)
  end
  station
end

def check_line(line, subway)
  line_exists = subway.key?(line)

  if !line_exists
    puts
    puts "That line does not exist."
    puts "The options are 'red', 'green', or 'orange'"
    puts
    puts "Please select a new line:"
    line = (gets.chomp.downcase).to_sym
    line = check_line(line, subway)
  end
  line
end

# Initial subway data structure
subway = {
  red: ["alewife", "davis", "porter", "harvard", "central", "kendall/mit", "park street", "south station"],
  green: ["haymarket", "government center", "park street", "boylston", "arlington", "copley"],
  orange: ["north station", "haymarket", "park street", "state street", "downtown crossing", "chinatown", "tufts medical center"]
}

# get parameters from user
puts "Please select an origin line (red, green, orange):"
origin_line = (gets.chomp.downcase).to_sym
origin_line = check_line(origin_line, subway)

puts
puts "Please select an origin station:"
origin_stop = gets.chomp.downcase
origin_stop = check_station(origin_stop, origin_line, subway)

puts
puts "Please select a destination line (red, green, orange):"
destination_line = (gets.chomp.downcase).to_sym
destination_line = check_line(destination_line, subway)

puts
puts "Please select a destination station:"
destination_stop = gets.chomp.downcase
destination_stop = check_station(destination_stop, destination_line, subway)

# set the intersection stop
intersection_stop = "park street"

#initialize num_stops to zero
num_stops = 0

# num stops on different lines
if origin_line != destination_line
  num_stops += (subway[origin_line].index(origin_stop) - subway[origin_line].index(intersection_stop)).abs
  num_stops += (subway[destination_line].index(intersection_stop) - subway[destination_line].index(destination_stop)).abs

# num stops on same line
else
  num_stops += (subway[origin_line].index(origin_stop) - subway[destination_line].index(destination_stop)).abs
end

puts "The #{destination_stop} station on the #{destination_line} line is #{num_stops} stops from the #{origin_stop} station on the #{origin_line} line."
