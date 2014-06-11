require 'pry'

#red = ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall', 'Park', 'South Station']
#green = ['Copley', 'Arlington', 'Boylston', 'Park Street', 'Government Center', 'Haymarket']
#orange = ['Tufts', 'Chinatown', 'Downtown Crossing', 'State Street', 'Park Street', 'Haymarket', 'North Station']

lines = {
  red: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall', 'Park Street', 'South Station'],
  green: ['Copley', 'Arlington', 'Boylston', 'Park Street', 'Government Center', 'Haymarket'],
  orange: ['Tufts', 'Chinatown', 'Downtown Crossing', 'State Street', 'Park Street', 'Haymarket', 'North Station']
}
# print "Enter the origin line: "
# change red to = gets.chomp.to_sym
origin_line = "red".to_sym

# print "Enter the origin stop: "
# change Davis to = gets.chomp.to_sym
origin_stop = "Davis".to_sym

# print "Enter the destination line: "
# change red to = gets.chomp.to_sym
destination_line = "red".to_sym

# print "Enter the destination stop: "
# change Kendall to = gets.chomp.to_sym
destination_stop = "Davis".to_sym


# lines[origin_line] returns the array of stops on given line
# index(origin_stop) searches for the index of the origin_stop provided
origin_index = lines[origin_line].index("Davis")
destination_index = lines[destination_line].index("Davis")

# simple case, both origin and destination stops are on the same line.
# use abs because you don't ever want to get a negative number
number_of_stops_same_line = (destination_index - origin_index).abs

# Returns index of Park street on your origin line
park_index_first_line = lines[origin_line].index("Park Street")
# Returns index of Park street on your destination line
park_index_switch_lines = lines[destination_line].index("Park Street")
# more complex, origin & destination stops are on different lines
number_of_stops_switch_lines = (park_index_first_line - origin_index).abs + (park_index_switch_lines - destination_index).abs

if origin_line == destination_line
  puts "You have to go #{number_of_stops_same_line} stops."
else
  puts "You have to go #{number_of_stops_switch_lines} stops."
end

binding.pry





