
#All lines intersect at **Park Street**, but not at any other stops. Unlike in real life,
 #the "Haymarket" on the Green Line and the "Haymarket" on the Orange Line are two separate,
  #unconnected stops.

#Given this subway system, write a Ruby program that prompts the user for an "origin" stop and a 
#"destination" stop, 
#and tells them the number of stops they would have to make on that journey. 
#For instance, traveling from Central to Copley would be 5 stops.




# Program has the subway system defined with appropriate data structures
# Program can find the distance between two stops on the same line
#Program can find the distance between two stops on different lines
#Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason &ndash; every line must intersect at a single common stop)
# Repository has several logical commits with descriptive messages
#Code uses correct indentation/style and descriptive variable names



# Defining the stops on the Red Line, Green Line and Orange Line
red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT","Park Street", "South Station"]

green_line = ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]

orange_line = ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]

#Asking what line the person is riding 
puts "What line are starting on?"
starting_line_str = gets.chomp

#Asking the origin
puts "What station are you starting at?"
starting_station_str = gets.chomp
#first_stop = red_line.index(starting_station)
#puts first_stop	

puts "What line are you ending at?"
ending_line_str = gets.chomp

#Asking the destination 
puts "What station are you getting off at?"
ending_station_str = gets.chomp 
#second_stop = red_line.index(ending_station)
#puts second_stop


# Which starting line to use 
if starting_line_str == "Red"
  starting_line = red_line
elsif starting_line_str == "Green"
  starting_line = green_line
else
  start_line = orange_line
end

#Which ending line to use 
if ending_line_str == "Red"
  ending_line = red_line
elsif ending_line_str == "Green"
  ending_line = green_line
else
  ending_line = orange_line
end

#Seeing how many stops there are
def stops(starting_line, starting_station, ending_line, ending_station)
  # get the index of the starting station
  starting_station_index = starting_line.index(starting_station)
  starting_station_index_Park = starting_line.index("Park Street")

  # get the index of the ending station
  ending_station_index = ending_line.index(ending_station)
  ending_station_index_Park = ending_line.index("Park Street")


  if starting_line == ending_line
    number_of_stops = (ending_station_index - starting_station_index).abs
  else  
    number_of_stops_a = (starting_station_index - starting_station_inex_Park).abs
    number_of_stops_b = (ending_station_index - ending_station_index_Park).abs
    number_of_stops= number_of_stops_a + number_of_stops_b 
    

  end
  number_of_stops
end

number_of_stops = stops(starting_line, starting_station_str,ending_line, ending_station_str)

  puts "The number of stops are #{number_of_stops}"







