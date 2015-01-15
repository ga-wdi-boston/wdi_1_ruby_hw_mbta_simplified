mbta = {
  "red" =>
    [
      "Alewife",
      "Davis",
      "Porter",
      "Harvard",
      "Central",
      "Kendall",
      "Park Street",
      "South Station"
    ],
  "green" =>     [
      "Haymarket - Green",
      "Government Center",
      "Park Street",
      "Boylston",
      "Arlington",
      "Copley"
    ],
  "orange" => [
      "North Station",
      "Haymarket Orange",
      "Park Street",
      "State Street",
      "Downtown Crossing",
      "Chinatown",
      "Tufts Medical Center"
    ]
}

puts "What is your origin line?"
mbta.each{|key, value|  puts key }
origin_line = gets.chomp
puts mbta[origin_line]

puts "What is your stop of origin?"
origin_stop = gets.chomp

# Get the index for the origin_stop
origin_stop_index = mbta[origin_line].find_index(origin_stop)

puts "What is your destination line?"
mbta.each{|key, value|  puts key }
destination_line = gets.chomp
puts mbta[destination_line]

puts "What is your destination stop?"
destination_stop = gets.chomp

# Get the index for the destination stop
destination_stop_index = mbta[destination_line].find_index(destination_stop)

# Find out the indexes for Park Street
origin_park_index = mbta[origin_line].find_index("Park Street")
destination_park_index = mbta[origin_line].find_index("Park Street")

# Check to see if origin line is the same as destination line.
# If so, you only need to subtract origin_stop_index from destination_stop_index
# If not the same origin_line, You need to subtract park_street_index from origin_stop_index
# and then subtract destination_park_index from destination_stop_index
# Once you have the number of stops on each line, add them together
if origin_line == destination_line
  number_of_stops = (origin_stop_index - destination_stop_index).abs
else
  number_of_stops = ((origin_stop_index - origin_park_index).abs + (destination_stop_index - destination_park_index).abs)
end


puts "It will take #{number_of_stops} stops to get from the #{origin_line} line: #{origin_stop} to #{destination_line} line: #{destination_stop}."
