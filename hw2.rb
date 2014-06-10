#create each individual line
red_line = ['Alewife', 'Davis', 'Porter','Harvard','Central', 'Kendall/MIT', 'Park Street','South Station' ]
orange_line = ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']
green_line = ['Haymarket','Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley']

# create mbta system
mbta_lines = {red: red_line, orange: orange_line, green: green_line}

meet_point = 'Park Street'


#user input variables ----------------------
#gets starting line
puts "What color line are you starting on?"
o_line = gets.chomp.downcase.to_sym
#checks for a valid line name
while !mbta_lines.key?(o_line)
  puts "Sorry not a valid line. Try again: "
  o_line = gets.chomp.downcase.to_sym
end

#gets starting stop
puts "What is your starting stop? (Use capital letters): "
o_stop = gets.chomp.capitalize
#checks to see if it's a valid stop
while !mbta_lines[o_line].index(o_stop)
  puts "Sorry not a valid stop on this line. Try again: "
  o_stop = gets.chomp.capitalize
end


#Gets destination line
puts "What color line will you stop on?"
d_line = gets.chomp.downcase.to_sym
#checks for a valid line name
while !mbta_lines.key?(d_line)
  puts "Sorry not a valid line. Try again: "
  d_line = gets.chomp.downcase.to_sym
end

#gets final stop
puts "What is your final stop? (Use capital letters): "
d_stop = gets.chomp.capitalize
#checks to see if it's a valid stop
while !mbta_lines[d_line].index(d_stop)
  puts "Sorry not a valid stop on this line. Try again: "
  d_stop = gets.chomp.capitalize
end

puts "Your starting line is #{o_line} and your starting stop is #{o_stop}"
puts "Your destination line is #{d_line} and your finishing stop is #{d_stop}"


=begin
#find distance between two points on the same line
if o_line == d_line
  same_line_dist = (o_line.index(o_stop) - o_line.index(d_stop)).abs
  #puts same_line_dist
end

#find distance between two points on different lines
if o_line != d_line
  same_line_dist = (o_line.index(o_stop) - o_line.index(meet_point)).abs
  other_line_dist = (d_line.index(meet_point) - d_line.index(d_stop)).abs
  total_dist = same_line_dist + other_line_dist
  #puts total_dist
end
=end
