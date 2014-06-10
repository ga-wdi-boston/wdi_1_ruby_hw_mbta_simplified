require 'pry'

# initialize map
charlie_map = {
  :red => %w(alewife davis porter harvard central kendall/mit parkstreet southstation),
  :green => %w(haymarket governmentcenter parkstreet boylston arlington copley),
  :orange => %w(northstation haymarket parkstreet statestreet downtown chinatown tuftsmedicalcenter)
}

# User-input information
origin_line = nil
origin_station = nil

puts "ORIGIN INFORMATION"
until charlie_map.key? origin_line
  print "Line: "
  origin_line = gets.chomp.downcase.to_sym
  unless charlie_map.key? origin_line # repeat until they
    puts "Invalid. Type red, green, or orange."
  end
end

until charlie_map[origin_line].include? origin_station
  print "Station: "
  origin_station = gets.chomp.downcase.delete(" ")
  unless charlie_map[origin_line].include? origin_station
    puts "Invalid. Type the name of the station."
  end
end

end_line = nil
end_station = nil

puts "DESTINATION INFORMATION"
until charlie_map.key? end_line
  print "Line: "
  end_line = gets.chomp.downcase.to_sym
  unless charlie_map.key? end_line # repeat until they
    puts "Invalid. Type red, green, or orange."
  end
end

until charlie_map[end_line].include? end_station
  print "Station: "
  end_station = gets.chomp.downcase.delete(" ")
  unless charlie_map[end_line].include? end_station
    puts "Invalid. Type the name of the station."
  end
end

