# # Program can find the distance between two stops on the same line
# # Program can find the distance between two stops on different lines
# # Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# # Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)
# # Repository has several logical commits with descriptive messages
# # Code uses correct indentation/style and descriptive variable names


require 'pry'

t_lines = {
          red_line: [
            "Alewife",
            "Davis",
            "Porter",
            "Harvard",
            "Central",
            "Kendall/MIT",
            "Park Street",
            "South Station"
            ],
          green_line: [
            "Haymarket",
            "Government Center",
            "Park Street",
            "Boylston",
            "Arlington",
            "Copley"
            ],
          orange_line: [
            "North Station",
            "Haymarket",
            "Park Street",
            "State Street",
            "Downtown Crossing",
            "Chinatown",
            "Tufts Medical Center"
            ]
        }

#prompt user for origin and destination info
puts "I'll tell you how to go where you want to go on the MBTA!"

puts "On which line will you originate? \n -Red \n -Orange \n -Green"
origin_line = gets.chomp.capitalize.to_sym
# if origin_line != (:Red || :Orange || :Green)
#   puts "Please choose Red, Orange, or Green"
#   quit(0)
# end

puts "What's your origin stop?"
origin_stop = gets.chomp.capitalize

puts "On which line is your destination? \n -Red \n -Orange \n -Green"
destination_line = gets.chomp.capitalize.to_sym
# if destination_line != (:Red || :Orange || :Green)
#   puts "Please choose Red, Orange, or Green"
#   quit(0)
# end

puts "What's your destination stop?"
destination_stop = gets.chomp.capitalize

# t_lines[origin_line].index(origin_stop)
# if origin_line == destination_line
    stops = (t_lines[destination_line.to_sym].index(destination_stop) - t_lines[origin_line.to_sym].index(origin_stop)).abs
    puts stops

  # puts t_lines[destination_line].index(destination_stop)
# else
# end

#result displayed to user
puts "Your Journey:"
puts "Traveling from #{origin_stop} on the #{origin_line} will take #{number_of_stops} stops to get to #{destination_stop} on the #{destination_line}"


