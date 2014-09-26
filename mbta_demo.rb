require_relative 'mbta'

mbta = MBTA.new

def choose_line
  mbta = MBTA.new
  puts "Choose a line."
  mbta.stops.keys.each do |line|
    puts "\t#{line}"
  end
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
  mbta.stops[line.to_sym].each do |stop|
    puts "\t#{stop}"
  end
  print "> "
  stop = gets.chomp.split.map { |i| i.capitalize  }.join(" ")
  while not mbta.stops[line.to_sym].include?(stop)
    puts "Sorry, that's not a stop. Please type it as shown."
    print "> "
    stop = gets.chomp.split.map { |i| i.capitalize  }.join(" ")
  end
  {
    line: line.to_sym,
    stop: stop
  }
end

puts "Welcome to the MBTA, Simplified!"
puts "Select your departing stop:"
origin = choose_stop(choose_line)
puts "Select your destination:"
destination = choose_stop(choose_line)
trip = {
  origin: origin,
  destination: destination
}
puts "The distance between these stops is: #{mbta.distance(trip)} stops."