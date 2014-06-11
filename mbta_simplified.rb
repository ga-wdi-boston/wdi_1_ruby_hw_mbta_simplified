require 'pry'

# Initialize variables
red_line_stations = ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station']
green_line_stations = ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley']
orange_line_stations  = ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']

red_line = {name: 'Red Line', stations: red_line_stations}
green_line = {name: 'Green Line', stations: green_line_stations}
orange_line = {name: 'Orange Line', stations: orange_line_stations}

intersection = 'Park Street'

station_control = [red_line, green_line, orange_line]
line_control = [red_line[:name], green_line[:name], orange_line[:name]]

# Get the origin line
select_line = line_control.to_a.join(', ')
print "Enter your origin line (#{select_line}): "
key = line_control.find_index(gets.chomp)
until key != nil
  print "Enter a valid origin line (#{select_line}): "
  key = line_control.find_index(gets.chomp)
end
origin_line = station_control.at(key)

# Get the origin station
select_station = origin_line[:stations].join(', ')
print "Enter your origin station (#{select_station}): "
origin_station_key = origin_line[:stations].find_index(gets.chomp)
until origin_station_key != nil
  print "Enter a valid station (#{select_station}): "
  origin_station_key = origin_line[:stations].find_index(gets.chomp)
end
origin_intersection_key = origin_line[:stations].find_index(intersection)
origin_distance = (origin_station_key - origin_intersection_key).abs
puts

# Get the destination line
print "Enter your destination line (#{select_line}): "
key = line_control.find_index(gets.chomp)
until key != nil
  print "Enter a valid destination line (#{select_line}): "
  key = line_control.find_index(gets.chomp)
end
dest_line = station_control.at(key)
puts

# Get the destination station
select_station = dest_line[:stations].join(', ')
print "Enter your destination (#{select_station}): "
dest_station_key = dest_line[:stations].find_index(gets.chomp)
until origin_station_key != nil
  print "Enter a valid destination (#{select_station}): "
  dest_station_key = dest_line[:stations].find_index(gets.chomp)
end
dest_intersection_key = dest_line[:stations].find_index(intersection)
dest_distance = (dest_station_key - dest_intersection_key).abs
puts

# Compute the total number of stops
if origin_line != dest_line
  tot_distance = (origin_distance + dest_distance)
elsif
  tot_distance = (dest_station_key - origin_station_key).abs
end
puts "Number of stops to travel: #{tot_distance}"
puts
