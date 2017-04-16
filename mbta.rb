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

origin_stop_index = mbta[origin_line].find_index(origin_stop)

puts "What is your destination line?"
mbta.each{|key, value|  puts key }
destination_line = gets.chomp
puts mbta[destination_line]

puts "What is your destination stop?"
destination_stop = gets.chomp

destination_stop_index = mbta[destination_line].find_index(destination_stop)

origin_park_index = mbta[origin_line].find_index("Park Street")
destination_park_index = mbta[origin_line].find_index("Park Street")

# Which of these lines is better code? The one referencing variables or the one evaluating on the fly?
if origin_line == destination_line
 # number_of_stops = (mbta[origin_line].find_index(origin_stop) - mbta[destination_line].find_index(destination_stop)).abs
  number_of_stops = (origin_stop_index - destination_stop_index).abs
else
  # number_of_stops = ((mbta[origin_line].find_index(origin_stop) - mbta[origin_line].find_index("Park Street")).abs + (mbta[destination_line].find_index(destination_stop) - mbta[origin_line].find_index("Park Street")).abs)
  number_of_stops = ((origin_stop_index - origin_park_index).abs + (destination_stop_index - destination_park_index).abs)
end

puts "It will take #{number_of_stops} stops to get from the #{origin_line} line: #{origin_stop} to #{destination_line} line: #{destination_stop}."
