# Initial subway data structure
subway = {
  red_line: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"],
  green_line: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
  orange_line: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
}

# initialize variables for testing
origin_stop = "Copley"
origin_line = :green_line
destination_stop = "Government Center"
destination_line = :green_line

# num stops on same line
num_stops = (subway[origin_line].index(origin_stop) - subway[destination_line].index(destination_stop)).abs

puts num_stops
