require 'pry'

# Create array of different stops for each line

red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"]

green_line = ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]

orange_line = ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]

lines = {"red" => red_line ,
         "green" => green_line,
         "orange" => orange_line}

puts "Are you traveling on 1 line?"
response = gets.chomp
# if response == "yes"

#   # Get journey's start and final destination
#   puts "enter jourey origin"
#   origin = gets.chomp
#   first_stop = red_line.index(origin)
#   puts first_stop

#   puts "enter final destination"
#   destination = gets.chomp
#   second_stop = red_line.index(destination)
#   puts second_stop

#   # Tells traveler number of stops till reaching destination
#   distance_between = second_stop - first_stop
#   puts "Your destination is #{distance_between.abs} stops away!"
# end

if response == "no"
  puts "What color line are you starting on?"
  line1 = lines[gets.chomp]
  puts "What color line is you final destination on?"
  line2 = lines[gets.chomp]
  puts "What is your starting point?"
  start = gets.chomp
  puts "What is you final destination?"
  final = gets.chomp
  leg_1 = line1.index(start) - (line1.index("Park Street"))
  leg_2 = line2.index(final) - (line2.index("Park Street"))
  total_distance = (leg_1.abs) + (leg_2.abs)
  puts "your total distance is #{total_distance}"
end
