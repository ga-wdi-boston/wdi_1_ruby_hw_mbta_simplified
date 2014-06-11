# This program will ask users for users origin and destination stop and inform them the distance between the stops.

#Data structures for mbta
mbta = {
  redline: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/mit', 'Parkstreet', 'Southstation'],
  greenline: ['Haymarket', 'Governmentcenter', 'Parkstreet', 'Boylston', 'Arlington','Copley'],
  orangeline: ['Northstation','Haymarket','Parkstreet','Statestreet','Downtowncrossing','Chinatown','Tuftsmedicalcenter']
}

intersection = Parkstreet
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

#Prompt the user and check the inputs.
origin_line = ''
while !mbta.has_key?(origin_line)
puts "Enter your origin line (Everything in lowercase): "
origin_line = gets.chomp.to_sym
end

origin_stop = ''
while !mbta[origin_line].include? origin_stop
puts "Enter your origin stop (Everything in lowercase): "
origin_stop = gets.chomp.capitalize
end

destination_line = ''
while !mbta.has_key?(destination_line)
puts "Enter your destination line (Everything in lowercase): "
destination_line = gets.chomp.to_sym
end

destination_stop = ''
while !mbta[destination_line].include? destination_stop
puts "Enter your destination stop (Everything in lowercase): "
destination_stop = gets.chomp.capitalize
end

#This method find index of each station
def station_index(line, stop, mbta)
  stations = mbta[line]
  return stations.index(stop)
end

if origin_line == destination_line
  origin_stop_index = station_index(origin_line,origin_stop,mbta)

  destination_stop_index = station_index(destination_line,destination_stop,mbta)

  distance = (origin_stop_index - destination_stop_index).abs

else
  origin_stop_index = station_index(origin_line,origin_stop,mbta)
  origin_intersection_index = station_index(origin_line,intersection,mbta)

  destination_stop_index = station_index(destination_line,destination_stop,mbta)
  destination_intersection_index = station_index(destination_line,intersection,mbta)

  distance = ((origin_stop_index - origin_intersection_index) + (destination_stop_index - destination_intersection_index)).abs

end

puts "Traveling from #{origin_stop} to #{destination_stop} is #{distance} stop(s)."
