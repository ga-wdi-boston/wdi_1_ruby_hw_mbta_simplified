

red_line = [
           "Alewife",
           "Davis",
           "Porter",
           "Harvard",
           "Central",
           "Kendall/MIT",
           "Park Street",
           "South Station"
         ]

green_line = [
           "Haymarket",
           "Government Center",
           "Park Street",
           "Boylston",
           "Arlington",
           "Copley"
         ]

orange_line = [
           "North Station",
           "Haymarket",
           "Park Street",
           "State Street",
           "Downtown Crossing",
           "Chinatown",
           "Tufts Medical Center"
         ]


subway = [red_line, green_line, orange_line]

puts subway

# Intersection for all three lines
puts red_line & green_line & orange_line
