

red_line = [
           "alewife",
           "davis",
           "porter",
           "harvard",
           "central",
           "kendall/mit",
           "park street",
           "south station"
         ]

green_line = [
           "haymarket",
           "government center",
           "park street",
           "boylston",
           "arlington",
           "copley"
         ]

orange_line = [
           "north station",
           "haymarket",
           "park street",
           "state street",
           "downtown crossing",
           "chinatown",
           "tufts medical center"
         ]


subway = [red_line, green_line, orange_line]



# User selects origin => need to select line as well!
puts "Welcome to the MBTA!"
print "Starting Point: "
origin = gets.chomp.downcase


=begin
# Validation to clarify which Haymarket
if origin == "Haymarket"
  print "Are you on the green line or orange line? "
  line = gets.chomp.downcase
end

if line.include?("green")
  origin = "Haymarket_Green"
  green_line[0] = "Haymarket_Green"  # will not work if order change
elsif line.include?("orange")
  origin = "Haymarket_Orange"
  orange_line[1] = "Haymarket_Orange" # will not work if order change
end
=end


# User selects destination
print "Destination: "
destination = gets.chomp.downcase

start_num = red_line.index(origin)
finish_num = red_line.index(destination)
stops = (finish_num - start_num).abs

puts stops

# If staying on the same line:






# SUM this for multiple lines:

  # Figure out distance from origin to "Park Street"
  # Figure out distance from Park Street to destination

# Print this result






# Intersection for all three lines
puts red_line & green_line & orange_line
