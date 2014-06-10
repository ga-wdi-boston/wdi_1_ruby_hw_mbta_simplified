# Initial data structure for subway system

subway = {
  green_line: ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley'],
  red_line: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station'],
  orange_line: ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']
}

#Manually set origin stop, destination stop, and intersection stop
origin_stop = "Haymarket"
destination_stop = "Government Center"
intersection_stop = "Park Street"

#Manually set origin and destination line
origin_line = 'green_line'.to_sym
destination_line = 'green_line'.to_sym

# Calculation for distance between stops on different lines with intersection stop
if origin_line != destination_line
  distance_origin_line = (subway[origin_line].index(intersection_stop) - subway[origin_line].index(origin_stop)).abs
  distance_destination_line = (subway[destination_line].index(intersection_stop) - subway[destination_line].index(destination_stop)).abs
  num_stops = distance_origin_line + distance_destination_line
else
  num_stops = (subway[origin_line].index(destination_stop) - subway[origin_line].index(origin_stop)).abs
end
 puts num_stops
