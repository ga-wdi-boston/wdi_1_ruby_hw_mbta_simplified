require 'pry'

# Program has the subway system defined with appropriate data structures
mbta = {
  red: ["alewife", "davis", "porter", "harvard", "central", "kendall/MIT", "park street", "south station"],
  green: ["haymarket", "government center", "park street", "boylston", "arlington", "copley"],
  orange: ["north station", "haymarket", "park street", "state street", "downtown crossing", "chinatown", "tufts medical center"]
}

binding.pry

# obtain input data from user: origin stop, origin line, destination stop, destination line

puts "What is your origin MBTA line?"

o_line = gets.chomp.downcase.to_sym

puts "What is your origin MBTA stop?"

o_stop = gets.chomp.downcase

puts "What is your desitination line?"

d_line = gets.chomp.downcase.to_sym

puts "What is your destination stop?"

d_stop = gets.chomp.downcase

# Take the user inputs and find/return the distance between the two stops on the same line

# will list the index location of the stop on the particular line

origin_index = mbta[o_line].index(o_stop)

dest_index = mbta[d_line].index(d_stop)

same_line_stops = origin_index - dest_index

#puts "It will take to #{same_line_stops.abs} to get from #{o_stop} to #{d_stop}."

binding.pry



# Program can find the distance between two stops on different lines



# Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)

# Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)

# Repository has several logical commits with descriptive messages

# Code uses correct indentation/style and descriptive variable names
