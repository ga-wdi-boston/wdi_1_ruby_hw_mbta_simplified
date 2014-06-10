# This program will ask users for users origin and destination stop and inform them the distance between the stops.

#Data structures for mbta
mbta = {
  redline: {station: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station']},
  greenline: {station: ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington','Copley'] },
  orangeline: {station: ['North Station','Haymarket','Park Street','State Street','Downtown Crossing','Chinatown','Tufts Medical Center'] },
  intersection: {station: ['Park Street']}
}

puts "Enter your origin line"
origin_line = 'redline'.to_sym
puts "Enter your origin stop"
origin_stop = 'Alewife'
puts "Enter your destination line"
destination_line = 'redline'.to_sym
puts "Enter your destination stop"
destination_stop = 'Porter'


origin_index =


