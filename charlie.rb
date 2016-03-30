require "pry"

#line arrays
red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall", "Park", "South Station"]
green_line = ["Haymarket", "Government Center", "Park", "Boylston", "Arlington", "Copley"]
orange_line = ["North Station", "Haymarket", "Park", "State", "Downtown Crossing", "Chinatown", "Tufts"]
#hash of line arrays
mta_lines = { red: red_line, green: green_line, orange: orange_line }

#center stop determination
center_stop = red_line & green_line & orange_line
if center_stop.length == 1
  center_stop = center_stop[0]
  puts "With current MBTA map, the intersection stop is set to #{center_stop}, proceed."
  puts
  # Want to add functionality to allow string entry
  # then check if entry is present in centers list
    # use conditional to set center stop to point to the index the entry matches
    # then set center stop to the string version of matched array index item
  # Otherwise give error message and allow new entry
else
  puts "Please select 1 intersection stop from #{centers_list} by its' index number"
  list_selection = gets.chomp.to_i
  centers_list[list_selection] = center_stop
  puts "The sole intersection is set to #{center_stop}"
  puts
end
# puts "You're now Charlie on the MTA, calculate your ride stops!"
# puts "Please enter an origin line color : "
o_line = "Red".downcase.to_sym
# puts "Please enter an origin stop: "
o_stop = "Park".capitalize
# puts "Please enter an destination line color: "
d_line = "Red".downcase.to_sym
# puts "Please enter an destination stop: "
d_stop = "Davis".to_s

# positions, finds index value for line and stop on o & d
origin_pos = mta_lines[o_line].index(o_stop)
dest_pos = mta_lines[d_line].index(d_stop)

intersect1 = mta_lines[o_line].index(center_stop)
intersect2 = mta_lines[d_line].index(center_stop)

#puts origin_pos
#puts intersect1

#puts dest_pos
#puts intersect2

if (o_line == d_line)
#  while origin_pos == dest_pos
  trip_distance = (origin_pos - dest_pos).abs
else
  trip_distance = ((origin_pos - intersect1).abs) + ((dest_pos - intersect2).abs)
end

puts "With origin line color #{o_line.capitalize}, origin stop #{o_stop} and destination line color #{d_line.capitalize}, destination stop #{d_stop} your trip distance will be #{trip_distance} stop(s). Enjoy your journey!"

