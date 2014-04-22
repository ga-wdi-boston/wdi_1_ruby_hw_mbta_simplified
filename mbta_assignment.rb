# Create array of different stops for each line

red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"]

green_line = ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]

orange_line = ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]


# Get journey's start and final destination
puts "enter jourey origin"
origin = gets.chomp
first_stop = red_line.index(origin)
puts first_stop

puts "enter final destination"
destination = gets.chomp
second_stop = red_line.index(destination)
puts second_stop

# Tells traveler number of stops till reaching destination
distance_between = second_stop - first_stop
puts "Your destination is #{distance_between.abs} stops away!"
