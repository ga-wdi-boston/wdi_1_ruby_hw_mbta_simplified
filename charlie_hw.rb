subway =
  { red: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "Boylston"],
  #park street
  #8 stops
   green: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
  #6 stops
  #park street = 2
   orange: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
  #7 stops
  #park street = 2, THIS NEEDS TO BE AN INDEX METHOD NOT A HARD NUMBER
}


#Gathering necessary information via 4 prompts
puts "What stop are you starting at?"
stop_origin = gets.chomp.split.map(&:capitalize).join(' ')

puts "And which line is #{stop_origin} on?"
line_origin = gets.chomp

puts "Which stop do you need to go to?"
stop_final = gets.chomp.split.map(&:capitalize).join(' ')

puts "And which line is #{stop_final} on?"
line_final = gets.chomp

#Converting to calculate distance

origin = subway[line_origin.downcase.to_sym]
puts origin.index(stop_origin)

destination = subway[line_final.downcase.to_sym]
puts destination.index(stop_final)

puts "You need to go ------ stops to get from #{stop_origin} on the #{line_origin} line to #{stop_final} on the #{line_final} line."


#Number of starting point
#Number of ending point
