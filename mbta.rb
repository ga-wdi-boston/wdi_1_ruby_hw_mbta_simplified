#prompt user for origin and destination information and determine how many stops it'll take to get from origin to destination.

stations = {
    "red" => {
      "alewife" => 6,
      "davis" => 5,
      "porter" => 4,
      "harvard" => 3,
      "central" => 2,
      "kendall/mit" => 1,
      "park street" => 0,
      "south station" => -1
    },
    "green" => {
      "haymarket" => 2,
      "government center" => 1,
      "park street" => 0,
      "boylston" => -1,
      "arlington" => -2,
      "copley" => -3
    },
    "orange" => {
      "north station" => 2,
      "haymarket" => 1,
      "park street" => 0,
      "state street" => -1,
      "downtown crossing" => -2,
      "chinatown" => -3,
      "tufts medical center" => -4
      }
    }


puts "Which line are you starting at?"
origin_line = gets.chomp.downcase

puts "Which stop are you starting at?"
origin_stop = gets.chomp.downcase

puts "Which line is your destination at?"
destination_line = gets.chomp.downcase

puts "Which stop is your destination at?"
destination_stop = gets.chomp.downcase

stop_number = stations[origin_line][origin_stop].abs + stations[destination_line][destination_stop].abs

puts "You have to go #{stop_number} stops to reach your destination."


