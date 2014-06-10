metro = {
  red:  %w(alewife davis porter harvard central kendall park south),
  green: %w(haymarket government park boylston arlington copley),
  orange: %w(north haymarket park state downtown chinatown tufts),
  intersection: "park"
}

start_line = :orange
end_line = :red
start_station = "tufts"
end_station = "alewife"

distance = -1

# If start-line and end-line are the same
if start_line == end_line
  distance = (metro[start_line].index(start_station) - metro[start_line].index(end_station)).abs
else
  # handle crossing to a different start_line
  distance_to_park = (metro[start_line].index(start_station) - metro[start_line].index(metro[:intersection])).abs
  distance_from_park = (metro[end_line].index(end_station) - metro[end_line].index(metro[:intersection])).abs
  distance = distance_to_park + distance_from_park
end

puts distance
