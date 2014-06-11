require 'pry'

red = ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall', 'Park', 'South Station']
green = ['Copley', 'Arlington', 'Boylston', 'Park Street', 'Government Center', 'Haymarket']
orange = ['Tufts', 'Chinatown', 'Downtown Crossing', 'State Street', 'Park Street', 'Haymarket', 'North Station']

lines = {
  red: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall', 'Park', 'South Station'],
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
destination_line = 'red'.to_sym

# print "Enter the destination stop: "
# change Kendall to = gets.chomp.to_sym
destination_stop = "Kendall"


# lines[origin_line] returns the array of stops on given line
# index(origin_stop) searches for the index of the origin_stop provided
origin_index = lines[origin_line].index(origin_stop)
destination_index = lines[destination_line].index(destination_stop)

# simple case, both origin and destination stops are on the same line.
number_of_stops = (origin_index - destination_index).abs

binding.pry

