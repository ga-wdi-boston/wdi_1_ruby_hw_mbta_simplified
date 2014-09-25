# need a way of assigning values to stops (k/v)
# store stops in array, stops at index
# absolute value function to turn negative numbers into positive

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

puts "Which line will you begin on? (Red, Green, or Orange)"
first_line = gets.chomp.downcase
puts "Which station will you start at?"
first_station = gets.chomp.downcase
puts "Which line will you end on?"
second_line = gets.chomp.downcase
puts "Which station will you end at?"
second_station = gets.chomp.downcase


#def commute(first_line, first_station, second_line, second_station)
  # setting index numbers for each station to navigate in array
  # if first_line == "red"
  #   first_line = 0
  # elsif first_line == "green"
  #   first_line = 1
  # elsif first_line == "orange"
  #   first_line = 2
  # elsif second_line == "red"
  #   second_line = 0
  # elsif second_line == "green"
  #   second_line = 1
  # elsif second_line == "orange"
  #   second_line = 2
  # end

puts mbta_lines[0][red]["davis"]

#   num_of_stops_single = mbta_lines[first_line][first_station].to_i - mbta_lines[first_line][second_station].to_i

# puts num_of_stops_single

# binding.pry



  # if they are the same, just find values for each key and subtract using absolute value
  # puts absolute value

  # if lines are not the same, find the value of each, subtract to park street of respective line and add together absolute values

  # if this doesn't work in method, remove method
















