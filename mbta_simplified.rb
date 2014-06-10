# This program will ask users for users origin and destination stop and inform them the distance between the stops.

#Data structures for mbta
mbta = {
  redline: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station'],
  greenline: ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington','Copley'],
  orangeline: ['North Station','Haymarket','Park Street','State Street','Downtown Crossing','Chinatown','Tufts Medical Center'],
  intersection: ['Park Street']
}

puts "Enter your origin line"
origin_line = 'redline'.to_sym
puts "Enter your origin stop"
origin_stop = 'Alewife'
puts "Enter your destination line"
destination_line = 'redline'.to_sym
puts "Enter your destination stop"
destination_stop = 'Porter'


#This method find index of each station
def station_index(line, stop, mbta)
  stations = mbta[line]
  puts stations
  puts stations.index(stop)
  return stations.index(stop)
end

origin_stop_index = station_index(origin_line,origin_stop,mbta)

destination_stop_index = station_index(destination_line,destination_stop,mbta)

distance = origin_stop_index + destination_stop_index

puts "Traveling from #{origin_stop} to #{destination_stop} is #{distance} stop(s)."





