subway =
  { red: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "Boylston"],
   green: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
   orange: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
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
journey_1 = (origin.index("Park Street") - origin.index(stop_origin)).abs

if line_origin == line_final
  destination = subway[line_final.downcase.to_sym]
  journey_2 = (destination.index("Park Street") - destination.index(stop_final))*-1
else
  destination = subway[line_final.downcase.to_sym]
  journey_2 = (destination.index("Park Street") - destination.index(stop_final)).abs
end

distance = journey_1 + journey_2

puts "You need to go #{distance} stops to get from #{stop_origin} on the #{line_origin} line to #{stop_final} on the #{line_final} line."

