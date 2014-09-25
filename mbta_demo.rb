require_relative 'mbta'

mbta = MBTA.new

def choose_line
  mbta = MBTA.new
  puts "Choose a line."
  puts mbta.stops.keys
  print "> "
  line = gets.chomp.downcase
end

def choose_stop(line)
  mbta = MBTA.new
  puts "Choose a stop."
  puts mbta.stops[line.to_sym]
  print "> "
  stop = gets.chomp.capitalize
  [line.to_sym, stop]
end

puts "Welcome to the MBTA, Simplified!"
puts "Select your departing stop:"
origin = choose_stop(choose_line)
puts "Select your destination:"
destination = choose_stop(choose_line)
puts "The distance between these stops is: #{mbta.distance(origin, destination)} stops"