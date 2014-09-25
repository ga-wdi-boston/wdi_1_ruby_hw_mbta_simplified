require_relative 'mbta'

mbta = MBTA.new

def choose_line
  mbta = MBTA.new
  puts "Choose a line."
  puts mbta.stops.keys
  print "> "
  line = gets.chomp.downcase
  while not mbta.stops.keys.include?(line.to_sym)
    puts "Sorry, that's not a line. Please type it as shown."
    print "> "
    line = gets.chomp.downcase
  end
  line
end

def choose_stop(line)
  mbta = MBTA.new
  puts "Choose a stop."
  puts mbta.stops[line.to_sym]
  print "> "
  stop = gets.chomp.split.map { |i| i.capitalize  }.join(" ")
  while not mbta.stops[line.to_sym].include?(stop)
    puts "Sorry, that's not a stop. Please type it as shown."
    print "> "
    stop = gets.chomp.split.map { |i| i.capitalize  }.join(" ")
  end
  [line.to_sym, stop]
end

puts "Welcome to the MBTA, Simplified!"
puts "Select your departing stop:"
origin = choose_stop(choose_line)
puts "Select your destination:"
destination = choose_stop(choose_line)
puts "The distance between these stops is: #{mbta.distance(origin, destination)} stops"