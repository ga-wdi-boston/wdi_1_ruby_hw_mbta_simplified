#Define subway system
red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendal/MIT", "Park Street", "South Station"]

green_line = ["Green1", "Green2", "Green3", "Green4", "Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]

orange_line = ["Orange1", "Orange2", "Orange3", "Orange4", "North Station", "Haymarket", "Park Street","State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]

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
if origin_train_line == "Green"
    origin_train_line = green_line
elsif origin_train_line == "Orange"
    origin_train_line = orange_line
else
    origin_train_line = red_line
end

if destination_train_line == "Green"
    destination_train_line = green_line
elsif destination_train_line == "Orange"
    destination_train_line = orange_line
else
    destination_train_line = red_line
end

print "Your journey is #{(destination_train_line.index(destination_station).to_i - origin_train_line.index(origin_station).to_i).abs} stops long."






