

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



# User selects origin
print "Welcome to the MBTA! Starting Point: "
origin = gets.chomp.capitalize

# User selects destination
print "Destination: "
destination = gets.chomp.capitalize

# SUM this:

  # Figure out distance from origin to "Park Street"
  # Figure out distance from Park Street to destination

# Print this result






# Intersection for all three lines
puts red_line & green_line & orange_line
