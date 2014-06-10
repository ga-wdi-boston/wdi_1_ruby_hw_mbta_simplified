metro = {
  red:  %w(alewife davis porter harvard central kendall park south),
  green: %w(haymarket government park boylston arlington copley),
  orange: %w(north haymarket park state downtown chinatown tufts)
}

start_line = :green
end_line = :green
start_station = "haymarket"
end_station = "copley"

distance = -1

# If start-line and end-line are the same
if start_line == end_line
  distance = (metro[start_line].index(start_station) - metro[start_line].index(end_station)).abs
else
  # handle crossing to a different start_line
end

puts distance
