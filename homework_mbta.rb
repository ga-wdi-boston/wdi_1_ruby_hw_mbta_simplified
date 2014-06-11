require 'pry'

mbta = {


redline: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"],

greenline: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],

orangeline: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]

}


puts "Origin Line"
origin_line = gets.chomp.to_sym
puts "Origin Stop"
origin_stop = gets.chomp.to_s
puts "Destination Line"
destination_line = gets.chomp.to_sym
puts "Destination Stop"
destination_stop = gets.chomp.to_s

#intersection_stop = mbta[orangeline].index("Park Street")


if origin_line == destination_line

 distance = (mbta[origin_line].index(origin_stop) - (mbta[destination_line].index(destination_stop)

else

distance = (mbta[origin_line].index(origin_stop) - (intersection_stop) - (mbta[destination_line].index(destination_stop)


end




binding.pry

