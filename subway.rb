red_line = ['Alewife', 'Davis', 'Porter','Harvard','Central', 'Kendall/MIT', 'Park Street','South Station' ]
green_line = ['Haymarket','Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley']
yellow_line = ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']

underground = { red: red_line,
  green: green_line,
  yellow: yellow_line
}

puts "What line will you be getting on?"
loc_line = gets.chomp.downcase.to_sym
while !underground.key?(loc_line)
  puts "That line is not valid"
  puts "Please select a valid line (red, green, yellow)."
  loc_line = gets.chomp.downcase.to_sym
end


puts "What stop will you be getting on?"
location = gets.chomp

puts "On what line is your destination?"
dest_line = gets.chomp.downcase.to_sym

puts "What is your destination stop?"
destination = gets.chomp
