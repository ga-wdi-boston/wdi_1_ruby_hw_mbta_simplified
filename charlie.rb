# # Program can find the distance between two stops on the same line
# # Program can find the distance between two stops on different lines
# # Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# # Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)


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

# prompt user for origin and destination info
puts "I'll tell you how to go where you want to go on the MBTA!"

puts "On which line will you originate? \n -Red \n -Orange \n -Green"
origin_line = gets.chomp.capitalize
# if origin_line != (:Red || :Orange || :Green)
#   puts "Please choose Red, Orange, or Green"
#   quit(0)
# end

puts "What's your origin stop?"
origin_stop = gets.chomp.capitalize

puts "On which line is your destination? \n -Red \n -Orange \n -Green"
destination_line = gets.chomp.capitalize
# if destination_line != (:Red || :Orange || :Green)
#   puts "Please choose Red, Orange, or Green"
#   quit(0)
# end

puts "What's your destination stop?"
destination_stop = gets.chomp.capitalize


# if origin and destintation lines are the same, we only care about finding the difference between the indexes within the array
 if origin_line == destination_line
    destin_stops = t_lines[destination_line.to_sym].index(destination_stop)
    origin_stops =  t_lines[origin_line.to_sym].index(origin_stop)
    puts (destin_stops - origin_stops).abs
  else
# if origin and destination lines are not the same, we have to calculate number_of_stops in relation to park street
  number_of_stops = (t_lines[destination_line.to_sym].index(destination_stop) - t_lines[origin_line.to_sym].index("Park Street")).abs
    end


# result displayed to user
puts "Your Journey:"
puts "Traveling from #{origin_stop} on the #{origin_line} will take #{number_of_stops} stops to get to #{destination_stop} on the #{destination_line}"
