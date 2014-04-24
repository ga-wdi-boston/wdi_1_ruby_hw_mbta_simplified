# Create an array for each line
green = ['Copley', 'Arlington', 'Boylston', 'Park Street', 'Government Center', 'Haymarket']

red = ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall', 'Park Street', 'South Station']

orange = ['Tufts', 'Chinatown', 'Downtown Crossing', 'State Street', 'Park Street', 'Haymarket', 'North Station']

# Create a hash for each subway line, containing a name that corresponds to the name of the line
# and stops that are assigned the aforementioned arrays.
green_line = { :name => 'green',
               :stops => green }

red_line = { :name => 'red',
             :stops => red }

orange_line = { :name => 'orange',
                :stops => orange }

# Create an intersection of all the subway lines
intersection_all = green & red & orange

# Create an array that captures all the subway lines (the hashes)
# into one array, so a loop can be performed on them
subway_system = [green_line, red_line, orange_line]

# Ask user for origin
puts 'What is your originating subway stop?'
origin = gets.chomp

# Create empty array for lines associated with the origin stop
# Create ampty array for lines associated with the destination stop
origin_lines = []
dest_lines = []

# For eash element (hashes) in the subway system,
# if the stops includes the origin, add the given hash into
# its respective array (created above)
subway_system.each do |line|
  if line[:stops].include?(origin)
    origin_lines << line
  end
end

puts 'What is your destination subway stop?'
dest = gets.chomp

subway_system.each do |line|
  if line[:stops].include?(dest)
    dest_lines << line
  end
end

# Takes the first value in the hash, returns the stops, and looks up the
# index of the destination and the origin.
# It subtracts the origin from the destination, the result of which should
# be an integer.
# Assigns that integer to the variable "stops".
stops = dest_lines[0][:stops].index(dest) - origin_lines[0][:stops].index(origin)

# Takes the absolute value of the integer and puts it on the screen
# for the User to see.
puts "#{stops.abs} stops to get from #{origin} to #{dest}."

# Test comment.
