mbta =
{red_line: ["Alewife", "Davis", "Porter", "Harvard", "Central",
            "Kendall/MIT", "Park Street", "South Station"],
green_line: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
orange_line: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing",
"Chinatown", "Tufts Medical Center"]}

CROSSROADS = "Park Street" # intersection point of all lines

origin_line = :red_line
origin_stop = "Central"
destination_line = :red_line
destination_stop = "South Station"

distance = (mbta[origin_line].index(origin_stop) - mbta[destination_line].index(destination_stop)).abs

puts "Your journey takes #{distance} stops"
