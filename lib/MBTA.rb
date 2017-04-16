def numStop(oriLine, oriStop, destLine, destStop)
theT = {
  "Red" => {
    "Alewife" => 6, "Davis" => 5, "Porter" => 4, "Harvard" => 3, "Central" => 2, "Kendall/MIT" => 1, "Park Street" => 0, "South Station" => -1
  },
  "Green" => {
    "Haymarket" => 2, "Government Center" => 1, "Park Street" => 0, "Boylston" => -1, "Arlington" => -2, "Copley" => -3
  },
  "Orange" => {
    "North Station" => 2, "Haymarket" => 1, "Park Street" => 0, "State Street" => -1, "Downtown Crossing" => -2, "Chinatown" => -3, "Tufts Medical Center" => -4
  }
}

  if oriLine == destLine
    return (theT[oriLine][oriStop] - theT[destLine][destStop]).abs
  else
    return (theT[oriLine][oriStop] - theT[destLine][destStop]).abs
  end
end

puts "What line are you starting on? (Red, Green, Orange)"
oriLine = gets.chomp
puts "What station are you starting on?"
oriStop = gets.chomp
puts "What line are you ending on? (Red, Green, Orange)"
destLine = gets.chomp
puts "What station are you ending on?"
destStop = gets.chomp
puts numStop(oriLine, oriStop, destLine, destStop)
