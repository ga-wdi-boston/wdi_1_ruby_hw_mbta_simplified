require 'pry'

origin_line = "red"

origin_stop = "alewife"

destination_line = "red"

destination_stop = "South Station"

lines = ["Red", "Green", "Orange"]

stops = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT",
"Park Street", "South Station"]

distance_travelled =
(stops.index(destination_stop.split.map(&:capitalize).join(' '))) -
(stops.index(origin_stop.split.map(&:capitalize).join(' ')))

puts "You travelled #{distance_travelled} stops"
