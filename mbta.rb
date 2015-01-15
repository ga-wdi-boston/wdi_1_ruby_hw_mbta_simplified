mbta = [
["haymarket" , "government_center" ,"park street" ,"boylston" ,"arlington" , "copley" ],
["alewife", "davis", "porter", "harvard", "central", "kendall", "park street", "south station" ],
["north station","haymarket", "park street", "state street", "downtown crossing", "chinatown", "tufts medical center"]]


def distance_same_line (line, start, stop)
  if line == "green line"
    line = mbta[0]
  elsif line == "red line"
    line = mbta[1]
  else
    line = mbta[2]
  end

  (line.index(start) - line.index(stop)).abs
end



def distance_other_line (start_line, end_line, start_stop, end_stop)
  if start_line == "green line"
    start_line = mbta[0]
  elsif start_line == "red line"
    start_line = mbta[1]
  else
    start_line = mbta[2]
  end

  if end_line == "green line"
    end_line = mbta[0]
  elsif end_line == "red line"
    end_line = mbta[1]
  else
    end_line = mbta[2]
  end

  first_line = (start_line.index("park_st") - (start_line.index(start_stop))).abs
  second_line = (end_line.index("park_st") - (end_line.index(end_stop))).abs
  distance = first_line + second_line + 1
end


