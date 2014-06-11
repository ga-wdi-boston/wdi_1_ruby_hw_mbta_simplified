subway = #creates HASH for unordered lines, and nested arrays for corresponding, ordered stops
  {
    red_line:['alewife','davis','porter','harvard','central kendall/mit','park street','south station'],
    green_line:['haymarket','government center','park street','boylston','arlington','copley'],
    orange_line:['north station','haymarket','park street','state street','downtown crossing','chinatown','tufts medical center']
  }


puts 'What color Origin Line would you like to take?'
  origin_line = (gets.chomp.downcase + '_line').to_sym
  #takes origin line color, downcases and converts to symbol to refer to specific line hash


puts 'What is your starting stop?'
  origin_stop = gets.chomp.downcase
#takes stop, downcases and converts to symbol to refer to specific array string

puts 'What is your Destination Line color?'
  destination_line = (gets.chomp.downcase+ '_line').to_sym
  #takes destination line color, downcases and converts to symbol to refer to specific line hash

puts 'What is your Destination Stop?'
  destination_stop = gets.chomp.downcase
#takes stop, downcases and converts to symbol to refer to specific array string


if origin_line == destination_line
  distance= (subway[origin_line].index(origin_stop) - subway[destination_line].index(destination_stop)).abs
puts distance

#if your stops are on the same line, just evaluate the distance

end
