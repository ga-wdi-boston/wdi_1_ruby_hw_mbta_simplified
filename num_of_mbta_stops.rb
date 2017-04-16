# Prompt the user for four separate pieces of data: origin line, origin stop, destination line, and destination stop

puts("Hi, please tell me which line you are on.")
color_origin = gets().chomp()

puts("Which stop are you currently at?")
stop_origin = gets().chomp()

puts("Next, please tell me which line you will need to get to.")
color_destination = gets().chomp()

puts("Which stop would you like to go to?")
stop_destination = gets().chomp()

# Hash created for each line to keep track of their respective stops; each given a position relative to "Park Street" where all of the the mbta lines intersect


  red_line = {
    color: "red",
    south_station: -1,
    park_street: 0,
    kendall_mit: 1,
    central: 2,
    harvard: 3,
    porter: 4,
    davis: 5,
    alewife: 6
  }

  orange_line = {
    color: "orange",
    north_station: -2,
    haymarket: -1,
    park_street: 0,
    state_street: 1,
    downtown_crossing: 2,
    chinatown: 3,
    tufts_medical_center: 4,
  }

  green_line = {
    color: "green",
    haymarket: -2,
    government_center: -1,
    park_street: 0,
    boylston: 1,
    arlington: 2,
    copley: 3
  }

if color_origin == "red"
  num_at_stop_1 = red_line[stop_origin.to_sym]
elsif color_origin == "green"
  num_at_stop_1 = green_line[stop_origin.to_sym]
else
  num_at_stop_1 = orange_line[stop_origin.to_sym]
end

if color_destination == "red"
  num_at_stop_2 = red_line[stop_destination.to_sym]
elsif color_destination == "green"
  num_at_stop_2 = green_line[stop_destination.to_sym]
else
  num_at_stop_2 = orange_line[stop_destination.to_sym]
end

#if the origin and destination are same line
if color_origin == color_destination
  if num_at_stop_1.to_i > 0 && num_at_stop_2.to_i > 0
    total_stops = (num_at_stop_1.to_i - num_at_stop_2.to_i).abs
  else
    total_stops = num_at_stop_1.to_i.abs + num_at_stop_2.to_i.abs
  end
else #if the origin and destination are not the same line
  total_stops = num_at_stop_1.to_i.abs + num_at_stop_2.to_i.abs
end

puts("The total number of stops to travel is #{total_stops}")








