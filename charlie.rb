mbta = {
  {red: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station']},
  {green: ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley']},
{orange: ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical School']}
}

origin_line = :orange #user input
origin_stop = mbta[dest_line].index('Chinatown') #will be var from user
origin = {origin_line, origin_stop}
dest_line = :orange #user input
dest_stop = mbta[dest_line].index('North Station') #user input
dest = {dest_line, dest_stop}

origin_line.each do starting at origin_stop{ |var| } until dest_stop

