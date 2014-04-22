#Given this subway system, write a Ruby program that prompts
#the user for an "origin" stop and a "destination" stop,
#and tells them the number of stops they would have to make
#on that journey. For instance, traveling from Central to Copley would
#be 5 stops.

#(2) Program has the subway system defined with appropriate data structures
#(1) Program can find the distance between two stops on the same line
#(2) Program can find the distance between two stops on different lines
#(1) Program gives the correct distance in edge cases (e.g. route starts and
  # ends at the same stop, route starts or ends at Park Street)
#(1) Stops and lines can be added, removed, or rearranged in your code without
# making any changes to the route-finding logic (within reason – every line
  # must intersect at a single common stop)
#(1) Repository has several logical commits with descriptive messages
#(2) Code uses correct indentation/style and descriptive variable names


#Bonus:
#(1) Add methods to your madness!
# We haven't fully covered defining your own methods yet,
# and technically none are required for this assignment.
# However, you might have noticed some places in your code that
# are doing the same thing multiple times, but with slightly different data.
# Introduce a method or two to resolve this duplication.


#Define Subway System Array
# red_line = {
#   red: "Alewife",
#   red: "Davis",
#   red: "Porter",
#   red: "Harvard",
#   red: "Central",
#   red: "Kendal/MIT",
#   red: "Park Street",
#   red: "South Station"
# }

# green_line =  {
#   green: "Haymarket",
#   green: "Government Center",
#   green: "Park Street",
#   green: "Boylston",
#   green: "Arlington",
#   green: "Copley"
# }

# orange_line = {
#   orange: "North Station"
#   orange: "Haymarket"
#   orange: "Park Street"
#   orange: "State Street"
#   orange: "Downtown Crossing"
#   orange: "Chinatown"
#   orange: "Tufts Medical Center"
# }

#Define subway system
red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendal/MIT", "Park Street", "South Station"]

green_line = ["Blank1", "Blank2", "Blank3", "Blank4", "Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]

orange_line = ["Blank1", "Blank2", "Blank3", "Blank4", "North Station", "Haymarket", "Park Street","State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]

t_lines = {
      color: "Red",
      color: "Green",
      color: "Orange"
    }

# Asks for station origin
print "Please enter the name of your station of origin:"
origin_station = gets.chomp

print "Please enter the color (Red, Green or Orange) of the train line #{origin_station} is on:"
origin_train_line = gets.chomp


#Asks for destination
print "Please enter the name of your destination station:"
destination_station = gets.chomp

print "Please enter the color (Red, Green or Orange) of the train line #{destination_station} is on:"
destination_train_line = gets.chomp

# Assigned the given train line to the appropriate array
#Calculate difference between destinations on same line
if origin_train_line == "Red"
    origin_train_line = red_line
elsif origin_train_line_== "Green"
    origin_train_line = green_line
else
    origin_train_line = orange_line
end

if destination_train_line == "Red"
    destination_train_line = red_line
elsif destination_train_line == "Green"
    destination_train_line = green_line
else
    destination_train_line = orange_line
end

print "Your journey is #{destination_train_line.index(destination_station) - origin_train_line.index(origin_station)} stops long."





