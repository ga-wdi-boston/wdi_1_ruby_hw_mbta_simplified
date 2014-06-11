require "pry"

# puts "You're now Charlie on the MTA, calculate your ride stops!"
# puts "Please enter an origin line: "
# change to gets.chomp.downcase.to_sym once ready for
# user input
o_line = "Red".downcase.to_sym

# puts "Please enter an origin stop: "
o_stop = "Davis"

# puts "Please enter an destination line: "
d_line = "Red".downcase.to_sym

# puts "Please enter an destination stop: "
d_stop = "Harvard"

red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall", "Park", "South Station"]

green_line = ["Haymarket", "Government Center", "Park", "Boylston", "Arlington", "Copley"]

orange_line = ["North Station", "Haymarket", "Park", "State", "Downtown Crossing", "Chinatown", "Tufts"]

mta_lines = { red: red_line, green: green_line, orange: orange_line }

# origin position, finds index value for line and stop

origin_pos = mta_lines[o_line].index(o_stop)

# destination position, finds index value for line and stop
dest_pos = mta_lines[d_line].index(d_stop)

if o_line == d_line
  trip_distance = (origin_pos - dest_pos).abs
end

puts origin_pos
puts dest_pos
puts trip_distance
