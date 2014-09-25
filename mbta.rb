# need a way of assigning values to stops (k/v)
# store stops in array, stops at index
# absolute value function to turn negative numbers into positive
# if they are the same, just find values for each key and subtract using absolute value
# puts absolute value
# if lines are not the same, find the value of each, subtract to park street of respective line and add together absolute values
# if this doesn't work in method, remove method



require 'pry'


mbta_lines = {
  red:
  ["alewife",
    "davis",
    "porter",
    "harvard",
    "central",
    "kendall\/mit",
    "park street",
    "south station"],
  green:
  ["haymarket",
    "government center",
    "park street",
    "boylston",
    "arlington",
    "copley"],
  orange:
  ["north station",
    "haymarket",
    "park street",
    "state street",
    "downtown crossing",
    "chinatown",
    "tufts medical center"]
  }


puts "Hi there! I'd love to help you figure out how far your commute is."

# getting user lines and stations
puts "Which line will you begin on? (Red, Green, or Orange)"
first_line = gets.chomp.downcase
puts "Which station will you start at?"
first_station = gets.chomp.downcase
puts "Which line will you end on?"
second_line = gets.chomp.downcase
puts "Which station will you end at?"
second_station = gets.chomp.downcase

def no_transfer(mbta_lines, line, stop1, stop2)
  if line == "red"
    num_stops = mbta_lines[:red].index(stop1) - mbta_lines[:red].index(stop2)
    puts num_stops.abs
  elsif line == "green"
    num_stops = mbta_lines[:green].index(stop1) - mbta_lines[:green].index(stop2)
    puts num_stops.abs
  elsif line == "orange"
    num_stops = mbta_lines[:orange].index(stop1) - mbta_lines[:orange].index(stop2)
    puts num_stops.abs
  end
end

def commute(mbta_lines, line1, station1, line2, station2)
  if line1 == line2
    no_transfer(mbta_lines, line, stop1, stop2)
  else
    stops_on_line1 = mbta_lines[line1.to_sym].index(station1) - mbta_lines[line1.to_sym].index("park street")
    stops_on_line2 = mbta_lines[line2.to_sym].index(station2) - mbta_lines[line2.to_sym].index("park street")
    puts stops_on_line1.abs + stops_on_line2.abs
  end
end



commute(first_line, first_station, second_line, second_station)




