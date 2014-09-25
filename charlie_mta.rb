# Program has the subway system defined with appropriate data structures
# Program can find the distance between two stops on the same line
# Program can find the distance between two stops on different lines
# Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)
# Repository has several logical commits with descriptive messages
# Code uses correct indentation/style and descriptive variable names

require 'pry'


trip = {
  red: [
        "alewife",
         "davis",
         "porter",
         "harvard",
         "central",
         "kendall/mit",
         "park street",
         "south station"
         ],

  green: [
          "haymarket",
          "government center",
          "park street",
          "boylston",
          "arlington",
          "copley"
          ],

  orange: [
          "north station","haymarket", "park street", "state street",
          "downtown crossing",
          "chinatown",
          "tufts medical center"
          ]
}



#prompts user for an 'origin' stop and a 'destination stop'
puts "What's the color of your origin line?"
origin_line = gets.chomp.downcase.to_sym

puts "What's your origin stop?"
origin_stop = gets.chomp.downcase

puts "What's the color of your destination line?"
destination_line = gets.chomp.downcase.to_sym

puts "What's your destination stop?"
destination_stop = gets.chomp.downcase



# takes index location of origin, subtracts intersection from it
# takes index location of destination, subtracts intersection from it
# takes index location

before_intersection = trip[origin_line].index(origin_stop) - trip[origin_line].index("park street").abs

after_intersection = trip[destination_line].index(destination_stop) - trip[destination_line].index("park street").abs

puts before_intersection + after_intersection

binding.pry




