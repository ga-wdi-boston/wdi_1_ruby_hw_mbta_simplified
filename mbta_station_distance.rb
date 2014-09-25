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
  IntersectingStation: "Park Street",
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
num_lines = gets.chomp.to_i

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

# Calculate stops between origin and destination
def calculate_distance(line_stops, origin_station, destination_station)
  orig_stop = line_stops.index(origin_station)
  dest_stop = line_stops.index(destination_station)
  dist = (orig_stop - dest_stop).abs
end


# Main part of the program
origin_station_stops = get_line_stops(mbta_lines, origin_line)
if num_lines == 1
  distance = calculate_distance(origin_station_stops, origin_station, destination_station)
else
  destination_station_stops = get_line_stops(mbta_lines, destination_line)
  origin_distance = calculate_distance(origin_station_stops, origin_station, mbta_lines[:IntersectingStation])
  destination_distance = calculate_distance(destination_station_stops, mbta_lines[:IntersectingStation], destination_station)
  distance = origin_distance + destination_distance
end

if num_lines == 1
  puts "It is #{distance} stops on the #{origin_line + ' Line'} from #{origin_station} to #{destination_station}"
else
  puts "It is #{distance} stops from #{origin_station} on the #{origin_line + ' Line'} to #{destination_station} on the #{destination_line + ' Line'}"
end






