
puts 'What is your origin stop?'
origin_stop = gets.chomp

puts 'What is your origin line?'
origin_line = gets.chomp.downcase.to_sym

puts 'What is your destination stop?'
destination_stop = gets.chomp

puts 'What is your destination line?'
destination_line = gets.chomp.downcase.to_sym

mbta = {
  red: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station'],
  green: ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley'],
  orange: ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']
}

if origin_line == destination_line
  distance = mbta[origin_line].index(origin_stop) - mbta[destination_line].index(destination_stop)
  distance = distance.abs
else
  distance = (mbta[origin_line].index(origin_stop) - mbta[origin_line].index('Park Street')).abs + (mbta[destination_line].index(destination_stop) - mbta[destination_line].index('Park Street')).abs
end

puts distance





