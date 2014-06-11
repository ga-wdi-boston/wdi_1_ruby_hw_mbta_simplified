require "pry"

#line arrays
red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall", "Park", "South Station"]
green_line = ["Haymarket", "Government Center", "Park", "Boylston", "Arlington", "Copley"]
orange_line = ["North Station", "Haymarket", "Park", "State", "Downtown Crossing", "Chinatown", "Tufts"]
#hash of line arrays
mta_lines = { red: red_line, green: green_line, orange: orange_line }

#center stop determination
centers_list = red_line & green_line & orange_line
if centers_list.length == 1
  center_stop = centers_list.to_s.to_s
  # !puts here works but shows brackets around #{center_stop} ????
  puts " With current MTA map, the intersection stop is set to #{center_stop}, proceed."
else
  # Want to add functionality to allow string entry
  # then check if entry is present in centers list
    # use conditional to set center stop to point to the index the entry matches
    # then set center stop to the string version of matched array index item
  # Otherwise give error message and allow new entry
  puts "Please select 1 intersection stop from #{centers_list} by its' index"
  list_selection = gets.chomp.to_i
  centers_list[list_selection] = center_stop
  puts "The sole intersection is set to #{center_stop}"
end
# puts "You're now Charlie on the MTA, calculate your ride stops!"
## potential new method Symbolize to .downcase.to_sym anything needed,
# keeps user input as a string for viewing if needed
# puts "Please enter an origin line color : "
o_line = "Red".downcase.to_sym
# puts "Please enter an origin stop: "
o_stop = "Davis"
# puts "Please enter an destination line color: "
d_line = "Red".downcase.to_sym
# puts "Please enter an destination stop: "
d_stop = "Davis"

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

puts trip_distance
