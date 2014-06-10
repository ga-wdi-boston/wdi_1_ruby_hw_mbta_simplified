# Initial subway data structure
subway = {
  red_line: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"],
  green_line: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
  orange_line: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
}

# initialize variables for testing
origin_stop = "South Station"
origin_line = :red_line
destination_stop = "Chinatown"
destination_line = :orange_line

# set the intersection stop
intersection_stop = "Park Street"

#initialize num_stops to zero
num_stops = 0

# num stops on different lines
if origin_line != destination_line
  num_stops += (subway[origin_line].index(origin_stop) - subway[origin_line].index(intersection_stop)).abs
  num_stops += (subway[destination_line].index(intersection_stop) - subway[destination_line].index(destination_stop)).abs

# num stops on same line
else
  num_stops += (subway[origin_line].index(origin_stop) - subway[destination_line].index(destination_stop)).abs
end


puts num_stops
