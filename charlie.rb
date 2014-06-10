require 'pry'

# Program has the subway system defined with appropriate data structures
mbta = {
  red: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"],
  green: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
  orange: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
}

binding.pry

# obtain input data from user: origin stop, origin line, destination stop, destination line

puts "What is your origin MBTA line?"

o_line = gets.chomp.downcase

puts "What is your origin MBTA stop?"

o_stop = gets.chomp.downcase

puts "What is your desitination line?"

d_line = gets.chomp.downcase

puts "What is your destination stop?"

d_stop = gets.chomp.downcase










# Program can find the distance between two stops on the same line

# Program can find the distance between two stops on different lines

# Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)

# Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)

# Repository has several logical commits with descriptive messages

# Code uses correct indentation/style and descriptive variable names
