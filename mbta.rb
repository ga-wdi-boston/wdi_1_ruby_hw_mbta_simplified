require 'pry'

# initialize map
charlie_map = {
  :red => %w(alewife davis porter harvard central kendall/mit parkstreet southstation),
  :green => %w(haymarket governmentcenter parkstreet boylston arlington copley),
  :orange => %w(northstation haymarket parkstreet statestreet downtown chinatown tuftsmedicalcenter),
}

# Auto-detect the transfer station, and quit if there's more than one option
intersections = []
# Get a list of all of the stations
charlie_map.values.each do |arr|
  intersections = intersections + arr
end
# Find out where the stations all intersect
charlie_map.values.each do |arr|
  intersections = intersections & arr
end

# If there's more than one big intersection, exit!
if intersections.length > 1
  puts "ERROR: All lines converge in more than one place."
  puts "The intersections are " + intersections.join(", ")
  exit
end

if intersections.length == 0
  puts "ERROR: There is no transfer station!"
  exit
end

intersection = intersections[0]

# User-input information

origin_line = nil
origin_station = nil

puts "ORIGIN INFORMATION"
until charlie_map.key? origin_line
  print "Line: "
  origin_line = gets.chomp.downcase.to_sym
  unless charlie_map.key? origin_line # repeat until they
    puts "Invalid. Type the name of a line"
  end
end

until charlie_map[origin_line].include? origin_station
  print "Station: "
  origin_station = gets.chomp.downcase.delete(" ")
  unless charlie_map[origin_line].include? origin_station
    puts "Invalid. Type the name of the station."
  end
end

end_line = nil
end_station = nil

puts "DESTINATION INFORMATION"

until charlie_map.key? end_line
  print "Line: "
  end_line = gets.chomp.downcase.to_sym
  unless charlie_map.key? end_line # repeat until they give a proper line name
    puts "Invalid. Type the name of a line"
  end
end

until charlie_map[end_line].include? end_station
  print "Station: "
  end_station = gets.chomp.downcase.delete(" ")
  unless charlie_map[end_line].include? end_station
    puts "Invalid. Type the name of the station."
  end
end

def leg_distance(map, line, start, destination)
  first_index = map[line].index(start)
  second_index = map[line].index(destination)
  return (first_index - second_index).abs
end
# I suspect this is inefficient, because I have to keep typing the map name
# But it works!

origin_index = charlie_map[origin_line].index(origin_station)
end_index = charlie_map[end_line].index(end_station)

# Measure distance between two stops on the same line
if origin_line == end_line
  stops_between = leg_distance(charlie_map, origin_line, origin_station, end_station)

else
  # Measure distance between first stop and transfer station
  stops_between_leg1 = leg_distance(charlie_map, origin_line, origin_station, intersection)

  # Measure distance between transfer station and final stop
  stops_between_leg2 = leg_distance(charlie_map, end_line, intersection, end_station)

  # Add them together
  stops_between = stops_between_leg1 + stops_between_leg2
end

puts "There are #{stops_between} stops between #{origin_station.capitalize} and #{end_station.capitalize}."
if origin_line != end_line
  puts "You will need to transfer at " + intersection.capitalize
end
