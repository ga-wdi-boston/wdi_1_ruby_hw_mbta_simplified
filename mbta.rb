stops = {

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

puts "Which T stop are you starting at?"
start_stop = gets().chomp().downcase

puts "What color is that line?"
start_line = gets().chomp().downcase

puts "Which T stop are you traveling to?"
end_stop = gets().chomp().downcase

puts "What color is that line?"
end_line = gets().chomp().downcase

if stops[start_line] == stops[end_line]
  moves = stops[start_line][start_stop] - stops[end_line][end_stop]
  moves
else
  moves = stops[start_line][start_stop].abs + stops[end_line][end_stop].abs
end
puts "You would have to move #{moves} stops on your journey."
