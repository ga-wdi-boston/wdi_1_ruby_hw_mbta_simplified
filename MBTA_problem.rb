#find the absolute position of the origin station to parkstreet on the same line. Then from park street on the destination line, calculate the absolute position of the station from park street.

#Caitlyn's solution with my comments

puts 'What is your origin stop?'
origin_stop = gets.chomp

puts 'What is your origin line?'
origin_line = gets.chomp.to_sym

puts 'What is your destination stop?'
destination_stop = gets.chomp

puts 'What is your destination line?'
destination_line = gets.chomp.to_sym

mbta = {
  red: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station'],
  green: ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley'],
  orange: ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']
}



if origin_line == destination_line

#distance equals the index number of the origin stop on the origin line minus the index number of the destination line set to an absolute value.

  distance = mbta[origin_line].index(origin_stop) - mbta[destination_line].index(destination_stop)
  distance = distance.abs
else

  #distance equals the index number of the origin stop on the origin line minus the index number for park street set to an absolute value plus the index number of the destination stop minus the index number for parkstreet on the destination line set to an absolute value.

  distance = (mbta[origin_line].index(origin_stop) - mbta[origin_line].index('Park Street')).abs + (mbta[destination_line].index(destination_stop) - mbta[destination_line].index('Park Street')).abs
end

puts 'There are #{distance} stops'
