#calculate the number of stops to park st. then calculate from where park st. appears on the relevant array to the stop.

# red_line_stations = [ "Alewife", "Davis", "Porter", "Harvard", "Central", "Kendell/MIT", "Park Street", "South Station"]

# red_line_stations = {
#   :alewife => 1,
#   :davis => 2,
#   :porter => 3,
#   :harvard => 4,
#   :central => 5,
#   :kendell => 6,
#   :parkstreet => 7,
#   :southstation => 8
# }

# Green_Line = ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]

# Orange_Line = ["North Station", "Haymarket", "Park_Street", "Slate Street"]

# def is_on_the_same_line?(origin_line, destination_line)
#   if origin_line == destination_line
#     return true
#   else
#     return false
#   end
# end

# def number_of_stops_same_line
#     position_1 = origin_line.index(origin_station)
#     position_2 = origin_line.index(destination_station)
#     distance = position_1 - position_2
#     number_of_stops = distance.abs
# end

# def number_of_stops_dif_line
#   position_1 = origin_line.index(origin_station) - origin_line.index("Park Street")).abs
#   position_2 = destination_line.index(destination_station) - destination_line.index("Park Street")).abs
#   distance = position_1 + position_2
# end



# destination_station = gets.chomp

# puts destination_station

# puts "Where are you coming from?"
# origin_station = gets.chomp

# puts origin_station

# puts "What is the line you are starting on?"
#   if gets.chomp == "Red Line"
#     origin_line = red_line
#   else
#     nil
#   end

# puts "What is the line your destination is on?"
#   if gets.chomp == "Red Line" && is_on_the_same_line? == true
#     destination_line = red_line
#   else
#     nil
#   end

puts "What is your destination stop?"

destination_station = gets.chomp.downcase.to_sym



# puts red_line_stations[]

# if red_line_stations.include? destination_station
#   puts red_line_stations
# end

#find the absolute position of the origin station to parkstreet on the same line. Then from park street on the destination line, calculate the absolute position of the station from park street.
