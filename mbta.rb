require 'byebug'

def get_mbta(line)
  mbta = [
  ["haymarket" , "government center" ,"park street" ,"boylston" ,"arlington" , "copley" ],
  ["alewife", "davis", "porter", "harvard", "central", "kendall", "park street", "south station" ],
  ["north station","haymarket", "park street", "state street", "downtown crossing", "chinatown", "tufts medical center"]]

  mbta[line]
end

def distance_same_line (line, start, stop)
  if line == "greenline"
    line = get_mbta(0)
  elsif line == "redline"
    line = get_mbta(1)
  else
    line = get_mbta(2)
  end

  (line.index(start) - line.index(stop)).abs
end



def distance_other_line (start_line, end_line, start_stop, end_stop)

  if start_line == "greenline"
    start_line = get_mbta(0)
  elsif start_line == "redline"
    start_line = get_mbta(1)
  else
    start_line = get_mbta(2)
  end

  if end_line == "greenline"
    end_line = get_mbta(0)
  elsif end_line == "redline"
    end_line = get_mbta(1)
  else
    end_line = get_mbta(2)
  end

  first_line = (start_line.index("park street") - start_line.index(start_stop)).abs
  second_line = (end_line.index("park street") - end_line.index(end_stop)).abs
  distance = first_line + second_line
end


