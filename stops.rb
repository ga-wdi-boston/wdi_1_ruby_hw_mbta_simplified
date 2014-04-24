#creating each array in order of how the train progresses for using position differential
red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"]
green_line = ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]
orange_line = ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
#asigning the total number of stops for each line as new variables to call later
#red_total_stops = red_line.length
#green_total_stops = green_line.length
#orange_total_stops = orange_line.length

#add park street index position for each line for later distance to park calc
park_pos_red = red_line.index("Park Street")
park_pos_green = green_line.index("Park Street")
park_pos_orange = orange_line.index("Park Street")

#for proofing if total stops on one line is grabbing exactly that
#puts red_total_stops
#puts green_total_stops
#puts orange_total_stops

#for proofing station position
#puts red_line.index("Alewife")
#puts red_line.index("South Station")
#puts red_line.index("Alewife") - red_line.index("South Station")


# must have a clear description as there is no validation added
puts "Note: please use one of the following stops exactly as written"
puts "red_line: Alewife, Davis, Porter, Harvard, Central, Kendall/MIT, Park Street, South Station"
puts "green_line: Haymarket, Government Center, Park Street, Boylston, Arlington, Copley"
puts "orange_line: North Station, Haymarket, Park Street, State Street, Downtown Crossing, \n Chinatown, Tufts Medical Center"



#some asked questions to figure out the to and from
puts "Line depart?"
line_depart = gets.chomp
puts "Station depart?"
station_depart = gets.chomp
puts "Line arrive?"
line_arrive = gets.chomp
puts "Station arrive?"
station_arrive = gets.chomp

#calculating departure stop's distance from park street


# will need to figure out some validation and what make a
# scenario that understands two separate lines
if line_depart == "red_line"
    initial_pos = red_line.index(station_depart)
    final_pos = red_line.index(station_arrive)
  elsif line_depart == "green_line"
    initial_pos = green_line.index(station_depart)
    final_pos = green_line.index(station_arrive)
  else
    initial_pos = orange_line.index(station_depart)
    final_pos = orange_line.index(station_arrive)
end

# just to spot-check pulling correct data
#puts initial_pos


if line_depart == line_arrive
  #calculates total stops for same-line travel
  same_line_stops = initial_pos - final_pos
  puts "Your trip will take #{same_line_stops.abs} stops"
  exit # put this here to stop the program for same line trips
end

#struggled to make statements that didn't have to be explicitly stated
#but below is longform calcluation of stops to park street and stops
#from park street in the condition that lines have changed
if line_depart == "red_line"
    stops_to_ps = red_line.index(station_depart).to_i - park_pos_red.to_i
  elsif line_depart == "green_line"
    stops_to_ps = green_line.index(station_depart).to_i - park_pos_green.to_i
  else
    stops_to_ps = orange_line.index(station_depart).to_i - park_pos_orange.to_i
end

if line_arrive == "red_line"
    stops_from_ps = red_line.index(station_arrive).to_i - park_pos_red.to_i
  elsif line_arrive == "green_line"
    stops_from_ps = green_line.index(station_arrive).to_i - park_pos_green.to_i
  else
    stops_from_ps = orange_line.index(station_arrive).to_i - park_pos_orange.to_i
end

#takes the stops to park street and stops from park street to calculate a trip
# that we know will be spanning two lines
puts "Your trip will take #{stops_to_ps.abs + stops_from_ps.abs} stops and will require a transfer at Park Street"

