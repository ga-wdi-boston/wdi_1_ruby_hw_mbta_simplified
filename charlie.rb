
mbta = {
  red: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT',
    'Park Street', 'South Station'],
  green: ['Haymarket', 'Government Center', 'Park Street', 'Boylston',
    'Arlington', 'Copley'],
  orange: ['North Station', 'Haymarket', 'Park Street', 'State Street','Downtown Crossing', 'Chinatown', 'Tufts Medical School']
}

puts "On which color line will you beginning your trip today?"
origin_line = gets.chomp.to_sym

puts "At which station will you be beginning your trip?"
origin_station = gets.chomp
origin_stop = mbta[origin_line].index(origin_station)

puts "On which color line will you ending your trip today?"
dest_line = dest_line.to_sym
puts "At which station will you be ending your trip?"
dest_station = gets.chomp
dest_stop = mbta[dest_line].index(dest_station)

switch_lines_stop = 'Park Street'

station_cntr = origin_stop #better named var for a cntr

if origin_stop == dest_stop
  puts "Your first and last stop is #{mbta[origin_line][station_cntr]}"
end

if origin_line == dest_line
  #origin and dest are on same line
  if origin_stop > dest_stop #ex 4..0
    while station_cntr > dest_stop #cntr starts at 4
      puts mbta[origin_line][station_cntr] #var[key][array index]
      station_cntr -= 1
    end
  else origin_stop < dest_stop #ex 0..4
    while station_cntr < dest_stop #cntr starts at 0 & inc to dest_stop
      puts mbta[origin_line][station_cntr] #var[key][array index]
      station_cntr += 1
    end
  end
end


if origin_line != dest_line
  if origin_stop > dest_stop #ex 4..0
    while station_cntr > dest_stop #cntr starts at 4
      puts mbta[origin_line][station_cntr]
      station_cntr -= 1
    until mbta[origin_line][mbta[origin_line].index(switch_lines_stop -1)]

    puts mbta[dest_line][mbta[origin_line].index(switch_lines_stop)]
    station_cntr_2 = switch_lines_stop + 1

    while station_cntr_2 > dest_stop
      puts mbta[origin_line][station_cntr] #var[key][array index]
      station_cntr -= 1
    end
 end
end

if origin_stop < dest_stop #ex 0..4
  while station_cntr < dest_stop #cntr starts at 0 & inc to dest_stop
    puts mbta[origin_line][station_cntr] #var[key][array index]
    station_cntr += 1
   until mbta[origin_line][mbta[origin_line].index(switch_lines_stop -1)]

   puts mbta[dest_line][mbta[origin_line].index(switch_lines_stop)]
   station_cntr_2 = switch_lines_stop + 1

   while station_cntr_2 < dest_stop
    puts mbta[origin_line][station_cntr] #var[key][array index]
    station_cntr += 1
  end
end
