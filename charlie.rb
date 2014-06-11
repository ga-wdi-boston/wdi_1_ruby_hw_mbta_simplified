

mbta = {
  red: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT',
    'Park Street', 'South Station'],
  green: ['Haymarket', 'Government Center', 'Park Street', 'Boylston',
    'Arlington', 'Copley'],
  orange: ['North Station', 'Haymarket', 'Park Street', 'State Street','Downtown Crossing', 'Chinatown', 'Tufts Medical School']
}

#lines will be the sym to use as keys in the mbta hash
origin_line = :orange #user input **.to_sym
origin_stop = mbta[origin_line].index('Chinatown') #will be var from user
origin = [origin_line, origin_stop]
dest_line = :orange #user input
dest_stop = mbta[dest_line].index('North Station') #user input
dest = [dest_line, dest_stop]

station_cntr = origin_stop #better named var for a cntr
if origin_stop > dest_stop #ex 4..0
  while station_cntr >= dest_stop #cntr starts at 4
    puts mbta[origin_line][station_cntr] #var[key][array index]
    station_cntr -= 1
  end
elsif origin_stop < dest_stop #ex 0..4
  while station_cntr <= dest_stop #cntr starts at 0 & inc to dest_stop
    puts mbta[origin_line][station_cntr] #var[key][array index]
    station_cntr += 1
  end
end

#do starting at origin_stop{ |var| } until dest_stop

