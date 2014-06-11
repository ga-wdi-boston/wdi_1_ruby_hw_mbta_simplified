# This program will ask users for users origin and destination stop and inform them the distance between the stops.

#Data structures for mbta
mbta = {
  redline: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'ParkStreet', 'SouthStation'],
  greenline: ['Haymarket', 'GovernmentCenter', 'ParkStreet', 'Boylston', 'Arlington','Copley'],
  orangeline: ['NorthStation','Haymarket','ParkStreet','StateStreet','DowntownCrossing','Chinatown','TuftsMedicalCenter']
}

# #TestCase#1
# puts "Enter your origin line"
# origin_line = 'redline'.to_sym
# puts "Enter your origin stop"
# origin_stop = 'Davis'
# puts "Enter your destination line"
# destination_line = 'redline'.to_sym
# puts "Enter your destination stop"
# destination_stop = 'Central'

#TestCase#2
# puts "Enter your origin line"
# origin_line = 'redline'.to_sym
# puts "Enter your origin stop"
# origin_stop = 'Porter'
# puts "Enter your destination line"
# destination_line = 'greenline'.to_sym
# puts "Enter your destination stop"
# destination_stop = 'Haymarket'

#Prompt the user
puts "Enter your origin line"
origin_line = gets.chomp.downcase.to_sym
puts "Enter your origin stop"
origin_stop = gets.chomp.downcase
puts "Enter your destination line"
destination_line = gets.chomp.downcase.to_sym
puts "Enter your destination stop"
destination_stop = gets.chomp.downcase

#This method find index of each station
def station_index(line, stop, mbta)
  stations = mbta[line]
  puts stations
  puts stations.index(stop)
  return stations.index(stop)
end

if origin_line == destination_line
  origin_stop_index = station_index(origin_line,origin_stop,mbta)

  destination_stop_index = station_index(destination_line,destination_stop,mbta)

  distance = (origin_stop_index - destination_stop_index).abs

else
  origin_stop_index = station_index(origin_line,origin_stop,mbta)
  origin_intersection_index = station_index(origin_line,'ParkStreet',mbta)

  destination_stop_index = station_index(destination_line,destination_stop,mbta)
  destination_intersection_index = station_index(destination_line,'ParkStreet',mbta)

  distance = ((origin_stop_index - origin_intersection_index) + (destination_stop_index - destination_intersection_index)).abs

end

puts "Traveling from #{origin_stop} to #{destination_stop} is #{distance} stop(s)."
