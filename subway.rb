subway = #creates HASH for unordered lines, and nested arrays for corresponding, ordered stops
  {
    red_line:['Alewife','Davis','Porter','Harvard','Central Kendall/MIT','Park Street','South Station'],
    green_line:['Haymarket','Government Center','Park Street','Boylston','Arlington','Copley'],
    orange_line:['North Station','Haymarket','Park Street','State Street','Downtown Crossing','Chinatown','Tufts Medical Center']
  }

#puts subway[:red_line].index('Davis')

distance= (subway[:red_line].index('Davis') - subway[:green_line].index('Arlington')).abs
#distance is equal to the absoulte value, the total number of stops on a trip


puts distance
#distance (.abs)

#distance_origin_line= (subway[origin_line].index(intersection_stop) - subway[green_line:].index('Haymarket')).abs
#distance_destination_line= (subway[origin_line].index(intersection_stop) - subway[green_line:].index('Haymarket')).abs
