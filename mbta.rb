
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

start_stop = 'Haymarket'
end_stop = 'Downtown Crossing'
start_line = 'Orange'.downcase.to_sym
end_line = 'Orange'.downcase.to_sym

stop_count = 0

subway[start_line].rotate(subway[start_line].index(start_stop)).each do | stop |

  if stop == end_stop
    break
  end

  stop_count += 1

end

if stop_count > subway[start_line].length / 2
  stop_count = subway[start_line].length - stop_count
end
