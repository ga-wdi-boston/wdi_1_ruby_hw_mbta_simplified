require 'pry'

# Initialize variables
red_line_stations = ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station']
green_line_stations = ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley']
orange_line_stations  = ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']
red_line = {name: 'Red Line', stations: red_line_stations}
green_line = {name: 'Green Line', stations: green_line_stations}
orange_line = {name: 'Orange Line', stations: orange_line_stations}
intersection = 'Park Street'

station_control = [red_line, green_line, orange_line]
line_control = [red_line[:name], green_line[:name], orange_line[:name]]

binding.pry

select_line = line_control.join(', ')
print 'Enter your origin line (#{select_line}): '
key = line_control.find_index(gets.chomp)
until key != nil
  print 'Enter a valid origin line (#{select_line})'
  key = line_control.find_index(gets.chomp)
end
origin_line = station_control.at(key)

binding.pry
