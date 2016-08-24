mbta={
red: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street","South Station"],
green: [ "Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
orange: ["North Station", "Haymarket2", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
}

puts "Thank you for riding the MBTA!"
puts "Where will you start your trip?"
start = gets.chomp.downcase.to_sym

# if (mbta[red].has_key?(start))
#     puts "That's on the red line"
#     #origin_line = red
# elsif (mbta[green].has_key?(start))
#      puts "That's on the green line"
#     #origin_line = green
# elsif (mbta[orange].has_key?(start))
#      puts "That's on the orange line"
#     #origin_line = orange
# end

puts 'Which line will you be riding?'
start_line = gets.chomp.downcase.to_sym

puts 'What is your destination stop?'
destination = gets.chomp.downcase.to_sym

puts 'What is your destination line?'
destination_line = gets.chomp.downcase.to_sym

#If start and destination are on the same line
if start_line == destination_line
  distance = mbta[start_line].index(start) - mbta[destination_line].index(destination)
   distance = distance.abs
#If destination is not on the same line
else
  distance = (mbta[start_line].index(start) - mbta[start_line].index('Park Street')).abs + (mbta[destination_line].index(destination) - mbta[destination_line].index('Park Street')).abs
end

puts "Your trip will take you through #{distance} MBTA stops."
