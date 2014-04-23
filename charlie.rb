mbta = {
        red: ["Alewife",
           "Davis",
           "Porter",
           "Harvard",
           "Central",
           "Kendall/MIT",
           "Park Street",
           "South Station"],

       green: [
           "Haymarket",
           "Government Center",
           "Park Street",
           "Boylston",
           "Arlington",
           "Copley"],

       orange: [
           "North Station",
           "Haymarket",
           "Park Street",
           "State Street",
           "Downtown Crossing",
           "Chinatown",
           "Tufts Medical Center"]
}


# User selects origin => need to select line as well!
puts "Welcome to the MBTA!"
print "What is your departing station? "
origin = gets.chomp


# Validation to clarify which Haymarket
# if origin == "Haymarket"
#   print "Are you on the green line or orange line? "

# end

# if line.include?("green")
#   origin = "Haymarket_Green"
#   green_line[0] = "Haymarket_Green"  # will not work if order change
# elsif line.include?("orange")
#   origin = "Haymarket_Orange"
#   orange_line[1] = "Haymarket_Orange" # will not work if order change
# end



if mbta[:red].include?(origin)
  origin_line = :red
  origin_num = mbta[:red].index(origin)
  to_park = mbta[:red].index("Park Street")
  origin_distance = (to_park - origin_num).abs   # distance current line
end

if mbta[:green].include?(origin)
  origin_line = :green
  origin_num = mbta[:green].index(origin)
  to_park = mbta[:green].index("Park Street")
  origin_distance = (to_park - origin_num).abs  # distance current line
end

if mbta[:orange].include?(origin)
  origin_line = :orange
  origin_num = mbta[:orange].index(origin)
  to_park = mbta[:orange].index("Park Street")
  origin_distance = (to_park - origin_num).abs   # distance current line
end


# User selects destination
print "Destination: "
destination = gets.chomp


if mbta[:red].include?(destination)
  destination_line = :red
  destination_num = mbta[:red].index(destination)
  from_park = mbta[:red].index("Park Street")
  destination_distance = (from_park - destination_num).abs   # distance current line
end

if mbta[:green].include?(destination)
  destination_line = :green
  destination_num = mbta[:green].index(destination)
  from_park = mbta[:green].index("Park Street")
  destination_distance = (from_park - destination_num).abs   # distance current line
end

if mbta[:orange].include?(destination)
  destination_line = :orange
  destination_num = mbta[:orange].index(destination)
  from_park = mbta[:orange].index("Park Street")
  destination_distance = (from_park - destination_num).abs   # distance current line
end

# Subtract location numbers to find stop difference
stops = origin_distance + destination_distance

if stops == 0
  puts "You have arrived at your destination!"
else
  puts "You have #{stops} stops until you arrive at your destination!"
end







# Assign number for locations
# destination_num = mbta[destination_line].index(destination)



# If staying on the same line:






# SUM this for multiple lines:

  # Figure out distance from origin to "Park Street"
  # Figure out distance from Park Street to destination

# Print this result






# Intersection for all three lines
# puts red_line & green_line & orange_line
