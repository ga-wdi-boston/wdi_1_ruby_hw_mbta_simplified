#create each individual line
red_line = ['Alewife', 'Davis', 'Porter','Harvard','Central', 'Kendall/MIT', 'Park Street','South Station' ]
orange_line = ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']
green_line = ['Haymarket','Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley']

# create mbta system
mbta_lines = [red_line, orange_line, green_line]
meet_point = 'Park Street'

#user input variables
o_line = red_line
o_stop = 'Alewife'
d_line = orange_line
d_stop = 'Chinatown'

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
  puts total_dist
end
