# # Program has the subway system defined with appropriate data structures
# # Program can find the distance between two stops on the same line
# # Program can find the distance between two stops on different lines
# # Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# # Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)
# # Repository has several logical commits with descriptive messages
# # Code uses correct indentation/style and descriptive variable names


require 'pry'


#prompt user for origin and destination info

puts "What's your origin stop?"
origin_stop = gets.chomp

puts "On which line?"
origin_line = gets.chomp

puts "What's your destination stop?"
destination_stop = gets.chomp

puts "On which line?"
destination_line = gets.chomp

puts "Your Journey:"
puts "Traveling from #{origin_stop} on the #{origin_line} will take #{stops} stops to get to #{destination_stop} on the #{destination_line}"


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
