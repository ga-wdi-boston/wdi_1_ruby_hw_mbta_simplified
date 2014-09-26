
mbta = {
  red: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall', 'Park', 'Sstation'],
  orange: ['Haymarket', 'Gcenter', 'Park', 'Boylston', 'Arlington', 'Copley'],
  green: ['Nstation', 'Haymarket', 'Park', 'State', 'Downtown', 'Chinatown', 'Tufts']
}

display_list = nil
case
# Below: Doesn't work (kindof works)
when display_list != 'y' || display_list != 'n'
  puts "Display list of acceptable station names? [y/n]"
  display_list = gets.chomp.downcase
  if display_list == 'y'
    puts mbta
  end
end

park = 'Park'

puts "What line are you starting on?"
origin_line = gets.chomp.downcase.to_sym
while !mbta.key?(origin_line)
  puts "Could not find that line. Please try again:"
  origin_line = gets.chomp.downcase.to_sym
end

puts "What stop are you starting at?"
origin_stop = gets.chomp.capitalize!
while !mbta[origin_line].index(origin_stop)
  puts "Could not find that stop. Please try again:"
  origin_stop = gets.chomp.capitalize
end

puts "What line is your destination on?"
destination_line = gets.chomp.downcase.to_sym
while !mbta.key?(destination_line)
  puts "Could not find that line. Please try again:"
  destination_line = gets.chomp.downcase.to_sym
end

puts "What is your destination stop?"
destination_stop = gets.chomp.capitalize!
while !mbta[destination_line].index(destination_stop)
  puts "Could not find that stop. Please try again:"
  destination_stop = gets.chomp.capitalize
end

if origin_line == destination_line
  total_stops = (mbta[origin_line].index(origin_stop) - mbta[destination_line].index(destination_stop)).abs
  puts "Total number of stops: #{total_stops}"
end

if origin_line != destination_line
  first_line_stops = (mbta[origin_line].index(origin_stop) - mbta[origin_line].index(park)).abs
  second_line_stops = (mbta[destination_line].index(park) - mbta[destination_line].index(destination_stop)).abs
  total_stops = first_line_stops + second_line_stops
  puts "Total number of stops: #{total_stops}"
end
