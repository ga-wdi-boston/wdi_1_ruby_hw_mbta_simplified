metro = {
  red:  %w(alewife davis porter harvard central kendall park south),
  green: %w(haymarket government park boylston arlington copley),
  orange: %w(north haymarket park state downtown chinatown tufts)
}

start_line = :orange
end_line = :green
start_station = "haymarket"
end_station = "copley"

distance = -1

# If start-line and end-line are the same
if start_line == end_line
  distance = (metro[start_line].index(start_station) - metro[start_line].index(end_station)).abs
else
  # handle crossing to a different start_line
  distance_to_park = (metro[start_line].index(start_station) - metro[start_line].index('park')).abs
  distance_from_park = (metro[end_line].index(end_station) - metro[end_line].index('park')).abs
  distance = distance_to_park + distance_from_park
end

puts distance
