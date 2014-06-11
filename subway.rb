subway = {
  red_line: [ "Alewife", "Davis", "Porter", "Harvard", "Central","Kendall/MIT",
    "Park Street", "South Station"],
  green_line: [ "Haymarket", "Government Center", "Park Street", "Boylston"
    "Arlington", "Copley"],
  orange_line: [ "North Station", "Haymarket", "Park Street", "Downtown Crossing",
    "Chinatown", "Tufts Medical Center"]
}

puts "Please choose a subway line"
line1 = gets.chomp
puts "Please choose an origin stop"
origin = gets.chomp

puts "Please choose a destination :"
dest = gets.chomp

