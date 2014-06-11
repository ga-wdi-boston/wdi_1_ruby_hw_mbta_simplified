red_line = ['Alewife', 'Davis', 'Porter','Harvard','Central', 'Kendall/MIT', 'Park Street','South Station' ]
green_line = ['Haymarket','Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley']
yellow_line = ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']

# generate underground Hash from line arrays
underground = { red: red_line,
                green: green_line,
                yellow: yellow_line
                }

# create transfer point for use when calculating number of stops between two lines
transfer_stop = "Park Street"

# asks user for initial location line
puts "What line will you be getting on?"
loc_line = gets.chomp.downcase.to_sym
# checks to see if input line is valid
while !underground.key?(loc_line)
  puts "That line is not valid"
  puts "Please select a valid line (red, green, yellow)."
  loc_line = gets.chomp.downcase.to_sym
end

# asks user for location stop. (stop s/he will be getting on)
puts "What stop will you be getting on?"
location = gets.chomp.capitalize
# checks to see if stop is valid
while !underground[loc_line].index(location)
  puts "That is not a valid stop on the #{loc_line}"
  puts "Please select a valid stop on the #{loc_line} line."
  location = gets.chomp.capitalize
end

# asks user for which line the destination stop is on
puts "On what line is your destination?"
dest_line = gets.chomp.downcase.to_sym
# checks for validity of that line
while !underground.key?(dest_line)
  puts "That line is not valid."
  puts "Please select a valid line (red, green, yellow)."
  dest_line = gets.chomp.downcase.to_sym
end

# asks user for final destination stop
puts "What is your destination stop?"
destination = gets.chomp.capitalize
# checks to verify existence of stop
while !underground[dest_line].index(destination)
  puts "That is not a valid stop on the #{dest_line}"
  puts "Please select a valid stop on the #{dest_line}"
  destination = gets.chomp.capitalize
end

# calculating distance between location stop and destination stop
# calculates distance between loc and dest stops if on the same line
if loc_line == dest_line
  one_line = (underground[loc_line].index(location) - underground[loc_line].index(destination)).abs
  puts "Go #{one_line} stops on the #{loc_line} line and get off"
# calculate distance between loc and dest stops when on separate lines
else
  first_line_stops = (underground[loc_line].index(location) - underground[loc_line].index(transfer_stop)).abs
  transfer_line_stops = (underground[dest_line].index(transfer_stop) - underground[dest_line].index(destination)).abs
  total_stops = first_line_stops + transfer_line_stops
end

puts "In total, you will travel #{total_stops} stops."
