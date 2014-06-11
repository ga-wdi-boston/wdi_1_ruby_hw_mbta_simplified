subway =
  { red: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "Boylston"],
  #park street
  #8 stops
   green: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
  #6 stops
  #park street = 2
   orange: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
  #7 stops
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
journey_2 = (origin.index("Park Street") - origin.index(stop_origin)).abs

if line_origin == line_final
  destination = subway[line_final.downcase.to_sym]
  journey_1 = destination.index("Park Street") - destination.index(stop_final)
else
  destination = subway[line_final.downcase.to_sym]
  journey_1 = (destination.index("Park Street") - destination.index(stop_final)).abs
end

puts journey_2
puts journey_1

distance = journey_2 + journey_1


puts "You need to go #{distance} stops to get from #{stop_origin} on the #{line_origin} line to #{stop_final} on the #{line_final} line."


#Number of starting point
#Number of ending point
