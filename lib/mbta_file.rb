def distance_lines(starting_line, starting_stop, ending_line, ending_stop)

  mbta = {
    "red" => {
      "alewife" => 6, "davis" => 5, "porter" => 4, "harvard" => 3, "central" => 2, "kendall" => 1, "park_st" => 0, "south_st" => -1
    },
    "green" => {
      "haymarket_g" => 2, "government_center" => 1, "park_st" => 0, "boylston" => -1, "arlington" => -2, "copley" => -3
    },
    "orange" => {
      "north_station" => 2, "haymarket_o" => 1, "park_st" => 0, "state_st" => -1, "downtown_crossing" => -2, "chinatown" => -3, "tufts_med_ctr" => -4
    }
  }

    if starting_line == ending_line
      return (mbta[starting_line][starting_stop] - mbta[ending_line][ending_stop]).abs
    else
      return (mbta[starting_line][starting_stop] - mbta[ending_line][ending_stop]).abs
    end

end

mbta = {
  "red" => {
    "alewife" => 6, "davis" => 5, "porter" => 4, "harvard" => 3, "central" => 2, "kendall" => 1, "park_st" => 0, "south_st" => -1
  },
  "green" => {
    "haymarket_g" => 2, "government_center" => 1, "park_st" => 0, "boylston" => -1, "arlington" => -2, "copley" => -3
  },
  "orange" => {
    "north_station" => 2, "haymarket_o" => 1, "park_st" => 0, "state_st" => -1, "downtown_crossing" => -2, "chinatown" => -3, "tufts_med_ctr" => -4
  }
}

puts "Pay close attention. You must pick out the correct information that is given below"
puts "These are the red line stops #{mbta["red"]}"
puts "These are the green line stops #{mbta["green"]}"
puts "These are the orange line stops #{mbta["orange"]}"

puts "What line are you starting on? (red, green, orange)"
starting_line = gets.chomp.to_s
if starting_line == "red"
  puts "thanks!"
elsif starting_line == "green"
  puts "thanks!"
elsif starting_line == "orange"
  puts "thanks!"
else
  puts "That is not a line, please enter your line again (either red, orange, or green)"
  starting_line = gets.chomp.to_s
end

puts "What stop are you starting at?"
starting_stop = gets.chomp.to_s

puts "What line are you ending on? (red, green, orange)"
ending_line = gets.chomp.to_s
if ending_line == "red"
  puts "thanks!"
elsif ending_line == "green"
  puts "thanks!"
elsif ending_line == "orange"
  puts "thanks!"
else
  puts "That is not a line, please enter your line again (either red, orange, or green)"
  ending_line = gets.chomp.to_s
end

puts "What station are you ending at?"
ending_stop = gets.chomp.to_s

if starting_line == ending_line
  puts "You're traveling on the same line (you're traveling on the #{starting_line} line)"
else
  puts "You're traveling on different lines. You're starting on the #{starting_line} line and you're ending on the #{ending_line} line"
end

puts "You're traveling from the #{starting_stop} stop on the #{starting_line} line to the #{ending_stop} stop on the #{ending_line} line"

puts "You have #{distance_lines(starting_line, starting_stop, ending_line, ending_stop)} stop(s) between your starting stop and ending stop."

