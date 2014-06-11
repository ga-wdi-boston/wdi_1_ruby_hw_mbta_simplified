red_line = ['Alewife', 'Davis', 'Porter','Harvard','Central', 'Kendall/MIT', 'Park Street','South Station' ]
green_line = ['Haymarket','Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley']
yellow_line = ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']

underground = { red: red_line,
  green: green_line,
  yellow: yellow_line
}

transfer_stop = "Park Street"

puts "What line will you be getting on?"
loc_line = gets.chomp.downcase.to_sym
while !underground.key?(loc_line)
  puts "That line is not valid"
  puts "Please select a valid line (red, green, yellow)."
  loc_line = gets.chomp.downcase.to_sym
end


puts "What stop will you be getting on?"
location = gets.chomp
while !underground[loc_line].index(location)
  puts "That is not a valid stop on the #{loc_line}"
  puts "Please select a valid stop on the #{loc_line} line."
  location = gets.chomp
end


puts "On what line is your destination?"
dest_line = gets.chomp.downcase.to_sym
while !underground.key?(dest_line)
  puts "That line is not valid."
  puts "Please select a valid line (red, green, yellow)."
  dest_line = gets.chomp.downcase.to_sym
end


puts "What is your destination stop?"
destination = gets.chomp
while !underground[dest_line].index(destination)
  puts "That is not a valid stop on the #{dest_line}"
  puts "Please select a valid stop on the #{dest_line}"
  destination = gets.chomp
end

if loc_line == dest_line
  one_line = (underground[loc_line].index(location) - underground[loc_line].index(destination)).abs
