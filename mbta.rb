# * Program has the subway system defined with appropriate data structures - DONE
# * Program can find the distance between two stops on the same line - DONE
# * Program can find the distance between two stops on different lines - DONE
# * Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# * Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason &ndash; every line must intersect at a single common stop)
# * Repository has several logical commits with descriptive messages
# * Code uses correct indentation/style and descriptive variable names

subway_map = {
  red_line: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"],
  green_line: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
  orange_line: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
}

# Calculates distance between stops of SAME line
def distance_same_line(start_stop, finish_stop, line, map)
  (map[line].index(start_stop) - map[line].index(finish_stop)).abs
end

puts distance_same_line("Alewife", "Park Street", :red_line, subway_map) # => 6

# Calculates distance between a stop and Park Street
def distance_from_park(stop, line, map)
  (map[line].index(stop) - map[line].index("Park Street")).abs
end

# puts distance_from_park("Haymarket", :green_line, subway_map) # => 2

# Calculates distance between two stops in DIFFERENT lines
def distance_different_lines(start_stop, start_line, finish_stop, finish_line, map)
  distance_from_park(start_stop, start_line, map) + distance_from_park(finish_stop, finish_line, map)
end

# puts distance_different_lines("Alewife", :red_line, "Haymarket", :green_line, subway_map) # => 8
puts distance_different_lines("Park Street", :red_line, "Park Street", :green_line, subway_map) # Edge case test 1: same station
puts distance_different_lines("Park Street", :green_line, "Davis", :red_line, subway_map) # Edge case test 1


