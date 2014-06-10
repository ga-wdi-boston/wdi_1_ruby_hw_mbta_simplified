#create each individual line
red_line = ['Alewife', 'Davis', 'Porter','Harvard','Central', 'Kendall/MIT', 'Park Street','South Station' ]
orange_line = ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']
green_line = ['Haymarket','Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley']

# create mbta system
mbta_lines = [red_line, orange_line, green_line]

#user input variables
o_line = red_line
o_stop = 'Alewife'
d_line = red_line
d_stop = 'Park Street'

#find distance between two points on the same line
if o_line == d_line
  same_line_dist = (o_line.index(o_stop) - o_line.index(d_stop)).abs
  puts same_line_dist
end
