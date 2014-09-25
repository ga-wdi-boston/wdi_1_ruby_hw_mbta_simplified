# Program has the subway system defined with appropriate data structures - DONE
# Program can find the distance between two stops on the same line - DONE
# Program can find the distance between two stops on different lines
# Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)
# Repository has several logical commits with descriptive messages
# Code uses correct indentation/style and descriptive variable names


charlie = {
  red_line: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"],
  green_line: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
  orange_line: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
}

#gets are origin_line, origin_stop, destination_line, destination_stop
puts "what is your original line do you want?"
origin_line = gets.chomp

puts "where is your origin stop?"
origin_stop = gets.chomp

puts "where is your destination line?"
destination_line = gets.chomp

puts "where is your destination stop?"
destination_stop = gets.chomp

# line = "red_line"
# origin = "Alewife"
# destination = "Porter"


# origin_line = "red_line"
# origin_stop = "Central"
# destination_line = "green_line"
# destination_stop = "Copley"

def same_line(charlie, line, origin, destination)
  if line == "red_line"
    stops = charlie[:red_line].index(origin) - charlie[:red_line].index(destination)
    puts stops.abs
  elsif line == "green_line"
    stops = charlie[:green_line].index(origin) - charlie[:green_line].index(destination)
    puts stops.abs
  else
    stops = charlie[:orange_line].index(origin) - charlie[:orange_line].index(destination)
    puts stops.abs
  end
end

def diff_line(charlie, origin_line, origin_stop, destination_line, destination_stop)
  if origin_line == destination_line
    same_line(charlie, origin_line, origin_stop, destination_stop)
  else
    stops_orign = charlie[origin_line.to_sym].index(origin_stop) - charlie[origin_line.to_sym].index("Park Street")
    stops_destination = charlie[destination_line.to_sym].index(destination_stop) - charlie[destination_line.to_sym].index("Park Street")
    puts stops_orign.abs + stops_destination.abs
  end
end
#     stops = charlie[:red_line].index(origin) - charlie[:red_line].index(destination)
#     puts stops.abs
#   elsif line == "green_line"
#     stops = charlie[:green_line].index(origin) - charlie[:green_line].index(destination)
#     puts stops.abs
#   else
#     stops = charlie[:orange_line].index(origin) - charlie[:orange_line].index(destination)
#     puts stops.abs
#   end
# end

diff_line(charlie, origin_line, origin_stop, destination_line, destination_stop)







# same_line(charlie, line, origin, destination)


