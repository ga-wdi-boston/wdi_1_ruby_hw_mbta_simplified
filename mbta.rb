# need a way of assigning values to stops (k/v)
# store stops in array, stops at index
# absolute value function to turn negative numbers into positive

require 'pry'


mbta_lines = [[["red"],
  [{"alewife" => 1,
    "davis" => 2,
    "porter" => 3,
    "harvard" => 4,
    "central" => 5,
    "kendall\/mit" => 6,
    "park street" => 7,
    "south station" => 8
  }]],
  [["green"],
  [{"haymarket" 1,
    "government center" 2,
    "park street" 3,
    "boylston" 4,
    "arlington" 5,
    "copley" 6
  }]],
  [["orange"],
  [{"north station" 1,
    "haymarket" 2,
    "park street" 3,
    "state street" 4,
    "downtown crossing" 5,
    "chinatown" 6,
    "tufts medical center" 7
    }]]]

puts "Hi there! I'd love to help you figure"
puts "out how far your commute is."
puts "Which station will you start at?"
first_station = gets.chomp.downcase
puts "Which station will you end at?"
second_station = gets.chomp.downcase
