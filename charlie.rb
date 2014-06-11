

# mbta data structure: a hash including 3 keys representing a subway line with corresponding values of arrays listing their subway stops.
mbta = {
  red: ["alewife", "davis", "porter", "harvard", "central", "kendall/MIT", "park street", "south station"],
  green: ["haymarket", "government center", "park street", "boylston", "arlington", "copley"],
  orange: ["north station", "haymarket", "park street", "state street", "downtown crossing", "chinatown", "tufts medical center"]
}



# obtain input data from user: origin stop, origin line, destination stop, destination line

puts "What is your origin MBTA line?"
o_line = gets.chomp.downcase.to_sym
# checks to make sure user inputs valid line name
if mbta.include?(o_line) != true
  puts "Please choose a valid MBTA line: red, green, or orange."
  o_line = gets.chomp.downcase.to_sym
end

puts "What is your origin MBTA stop?"
o_stop = gets.chomp.downcase
# checks to make sure user inputs valid stop name
if mbta[o_line].include?(o_stop) != true
  puts "Please choose a valid MBTA stop."
  o_stop = gets.chomp.downcase
end

puts "What is your desitination line?"
d_line = gets.chomp.downcase.to_sym
# checks to make sure user inputs valid line name
if mbta.include?(d_line) != true
  puts "Please choose a valid MBTA line: red, green, or orange."
  d_line = gets.chomp.downcase.to_sym
end

puts "What is your destination stop?"
d_stop = gets.chomp.downcase
# checks to make sure user inputs valid stop name
if mbta[d_line].include?(d_stop) != true
  puts "Please choose a valid MBTA stop."
  d_stop = gets.chomp.downcase
end

intersect = "park street"
o_to_intersect = (mbta[o_line].index(o_stop) - mbta[o_line].index(intersect)).abs
intersect_to_d = (mbta[d_line].index(intersect) - mbta[d_line].index(d_stop)).abs

# Take the user inputs and find/return the distance between the two stops on the SAME line
if o_line == d_line
# will list the index location of the stop on the particular line
  origin_index = mbta[o_line].index(o_stop)
  dest_index = mbta[d_line].index(d_stop)
  same_line_stops = (origin_index - dest_index).abs
  puts "It will take #{same_line_stops} stops to get from #{o_stop.capitalize} to #{d_stop.capitalize}."
# Take the user inputs and find/return the distance between the two stops on DIFFERENT line
else
  diff_line_stops = o_to_intersect + intersect_to_d
  puts "It will take #{diff_line_stops} stops to get from #{o_stop.capitalize} to #{d_stop.capitalize}."
end

# Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)

# Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)

# Repository has several logical commits with descriptive messages

# Code uses correct indentation/style and descriptive variable names
