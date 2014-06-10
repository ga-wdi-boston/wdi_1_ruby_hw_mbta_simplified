subway = [
  {red: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "Boylston"]},
  {green: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]},
  {orange: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]}
]

puts "What stop are you starting at?"
stop_origin = gets.chomp

puts "And which line is #{stop_origin} on?"
line_origin = gets.chomp.downcase.to_sym

puts "Which stop do you need to go?"
stop_final = gets.chomp

puts "And which line is #{stop_final} on?"
line_final = gets.chomp.downcase.to_sym
