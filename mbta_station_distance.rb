require 'pry'

## Specifications

# "Program has the subway system defined with appropriate data structures
# "Program can find the distance between two stops on the same line
# "Program can find the distance between two stops on different lines
# "Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# "Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason &ndash; every line must intersect at a single common stop)
# "Repository has several logical commits with descriptive messages
# "Code uses correct indentation/style and descriptive variable names


# Database containing the lines and their requisite stops
mbta_lines = {
  Red: [
    "Alewife",
    "Davis",
    "Porter",
    "Harvard",
    "Central",
    "Kendall/MIT",
    "Park Street",
    "South Station"],
  Green: [
    "Haymarket",
    "Government Center",
    "Park Street",
    "Boylston",
    "Arlington",
    "Copley"],
  Orange: [
    "North Station",
    "Haymarket",
    "Park Street",
    "State Street",
    "Downtown Crossing",
    "Chinatown",
    "Tufts Medical Center"]
  }

puts "Welcome to the MBTA station distance calculator."

puts "Is this a one or a two line itinery"
num_lines = gets.chomp

# Origin Line
puts "Please enter the line you want to start at (Red, Green, Orange)"
origin_line = gets.chomp
destination_line = origin_line

# Origin Station
puts "Please enter your station of origin"
origin_station = gets.chomp

# Destination Line
if num_lines == 2
  puts "Please enter the line you want to transfer to (Red, Green, Orange)"
  destination_line = gets.chomp
end

# Destination Station
puts "Please enter your destination station"
destination_station = gets.chomp


# Returns an array of all the stops for this station
def get_line_stops(lines, origin_line)
  lines[origin_line.to_sym]
end

origin_station_stops = get_line_stops(mbta_lines, origin_line)
if num_lines == 2
  destination_station_stops = get_line_stops(mbta_lines, destination_line)
end

# def calculate_distance(origin_line, orign_station, destination_line, destination_line = origin_line)
# end



