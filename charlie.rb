require 'pry'

# All stops
# stops = {
#   alewife: {line: 'red'},
#   davis: {line: 'red'},
#   porter: {line: 'red'},
#   harvard: {line: 'red'},
#   central: {line: 'red'},
#   kendall: {line: 'red'},
#   park_street: {line: 'red'},
#   south_station: {line: 'red'},
#   haymarket: [line: 'green'],
#   government_center: {line: 'green'},
#   park_street: {line: 'green'},
#   boylston: {line: 'green'},
#   arlington: {line: 'green'},
#   copley: {line: 'green'},
#   north_station: {line: 'orange'},
#   haymarket: {line: 'orange'},
#   park_street: {line: 'orange'},
#   state_street: {line: 'orange'},
#   downtown_crossing: {line: 'orange'},
#   chinatown: {line: 'orange'},
#   tufts_medical_center: {line: 'orange'}
# }

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


