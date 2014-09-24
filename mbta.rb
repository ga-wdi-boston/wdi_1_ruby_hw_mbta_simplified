# * Program has the subway system defined with appropriate data structures - DONE
# * Program can find the distance between two stops on the same line - Done
# * Program can find the distance between two stops on different lines
# * Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# * Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason &ndash; every line must intersect at a single common stop)
# * Repository has several logical commits with descriptive messages
# * Code uses correct indentation/style and descriptive variable names

subway_map = {
  red_line: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"],
  green_line: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
  orange_line: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
}

def distance_same_line(start_stop, finish_stop, line, map)
  distance = (map[line].index(start_stop) - map[line].index(finish_stop)).abs
end

puts distance_same_line("Alewife", "South Station", :red_line, subway_map)
