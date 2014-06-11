require "pry"

# puts "You're now Charlie on the MTA, calculate your ride stops!"
# puts "Please enter an origin line: "
# change to gets.chomp.downcase.to_sym once ready for
# user input

## potential new method Symbolize to .downcase.to_sym anything needed,
# keeps user input as a string for viewing if needed

o_line = "Red".downcase.to_sym

# puts "Please enter an origin stop: "
o_stop = "Davis"

# puts "Please enter an destination line: "
d_line = "Green".downcase.to_sym

# puts "Please enter an destination stop: "
d_stop = "Copley"

#line arrays
red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall", "Park", "South Station"]
green_line = ["Haymarket", "Government Center", "Park", "Boylston", "Arlington", "Copley"]
orange_line = ["North Station", "Haymarket", "Park", "State", "Downtown Crossing", "Chinatown", "Tufts"]

#hash of line arrays
mta_lines = { red: red_line, green: green_line, orange: orange_line }

# origin position, finds index value for line and stop
origin_pos = mta_lines[o_line].index(o_stop)

# destination position, finds index value for line and stop
dest_pos = mta_lines[d_line].index(d_stop)

# hard code "park" could be replaced with a method 'center_stop'
# center_stop would compare all arrays with & to find intersect
# and set intersect to a string version of this array IF the array
# contained only one entry (unique point)
intersect1 = mta_lines[o_line].index("Park")
intersect2 = mta_lines[d_line].index("Park")

puts origin_pos
puts intersect1

puts dest_pos
puts intersect2

if (o_line == d_line)
  trip_distance = (origin_pos - dest_pos).abs
else
  trip_distance = ((origin_pos - intersect1).abs) + ((dest_pos - intersect2).abs)
end

puts trip_distance
