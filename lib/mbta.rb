origin_line
origin_stop
dest_line
dest_stop

mbta =
{red_line: ["Alewife", "Davis", "Porter", "Harvard", "Central",
        "Kendall/MIT", "Park Street", "South Station"],
green_line: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
orange_line: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing",
"Chinatown", "Tufts Medical Center"]
}





#Same line

if origin_line == dest_line
  distance = (mbta[origin_line].index(origin_stop)) - (mbta[dest_line].index(dest_stop)).abs
else
  distance =
end







