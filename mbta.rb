
red_line_stops = ['Alewife',
'Davis',
'Porter',
'Harvard',
'Central',
'Kendall/MIT',
'Park Street',
'South Station'
]
green_line_stops = ['Haymarket',
'Government Center',
'Park Street',
'Boylston',
'Arlington',
'Copley'
]
orange_line_stops = ['North Station',
'Haymarket',
'Park Street',
'State Street',
'Downtown Crossing',
'Chinatown',
'Tufts Medical Center'
]


subway = {red: red_line_stops, green: green_line_stops, orange: orange_line_stops}



def stops_in_same_line(start_stop, end_stop, line, the_subway)
  stop_count = 0

  the_subway[line].rotate(the_subway[line].index(start_stop)).each do | stop |

    if stop == end_stop
      break
    end

    stop_count += 1
  end

  if stop_count > the_subway[line].length / 2
    stop_count = the_subway[line].length - stop_count
  end

  stop_count

end

start_pos= 'Haymarket'
end_pos = 'Downtown Crossing'
start_line = 'Orange'.downcase.to_sym
end_line = 'Orange'.downcase.to_sym


puts stops_in_same_line(start_pos,end_pos,start_line,subway)








