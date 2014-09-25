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
def getting_stations (first_line, second_line)
  puts "Which line will you begin on? (Red, Green, or Orange)"
  first_line = gets.chomp.downcase
    if first_line == "red"
      return :red
    elsif first_line == "green"
      return :greem
    elsif first_line == "orange"
      return :orange
    end
  puts "Which station will you start at?"
  first_station = gets.chomp.downcase
  puts "Which line will you end on?"
  second_line = gets.chomp.downcase
    if second_line == "red"
      return :red
    elsif second_line == "green"
      return :greem
    elsif second_line == "orange"
      return :orange
    end
  puts "Which station will you end at?"
  second_station = gets.chomp.downcase
end

def commute(line1, station1, line2, station2)
  if line1 == line2
    num_stops = mbta_lines[line1].index(station1) - mbta_lines[line1].index(station2)
    puts num_stops.abs
end


















