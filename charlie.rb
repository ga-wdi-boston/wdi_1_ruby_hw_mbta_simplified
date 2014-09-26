# # Program can find the distance between two stops on the same line
# # Program can find the distance between two stops on different lines
# # Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
# # Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)


require 'pry'


t_lines = {
          red: [
            "alewife",
            "davis",
            "porter",
            "harvard",
            "kentral",
            "kendall/mit",
            "park street",
            "south station"
            ],
          green: [
            "haymarket",
            "government center",
            "park street",
            "boylston",
            "arlington",
            "copley"
            ],
          orange: [
            "north station",
            "haymarket",
            "park street",
            "state street",
            "downtown crossing",
            "chinatown",
            "tufts medical center"
            ]
        }
# end

# Get user input
def get_origin_line

  puts "I'll tell you how to go where you want to go on the MBTA!"
  puts "On which line will you originate? \n -Red \n -Orange \n -Green"
  origin_line = gets.chomp.downcase.to_sym

  # Error checking
  # if origin_line != (:red || :orange || :green)
  #   puts "Please choose Red, Orange, or Green"
  #   quit(0)
  # else
  #   origin_line
  # end
end

def get_origin_stop

  puts "What's your origin stop?"
  origin_stop = gets.chomp.downcase

end

def get_destination_line

  puts "On which line is your destination? \n -Red \n -Orange \n -Green"
  destination_line = gets.chomp.downcase.to_sym

  # Error checking
  # if destination_line != (:red || :orange || :green)
  #   puts "Please choose Red, Orange, or Green"
  #   quit(0)
  # else
  #   destination_line
  # end

end

def get_destination_stop

  puts "What's your destination stop?"

  destination_stop = gets.chomp.downcase
end

def line_logic(subway_map,origin_line,origin_stop,destination_line,destination_stop)

  # This gets us from our origin to Park Street

  part1 = (subway_map[origin_line].index("park street") - subway_map[origin_line].index(origin_stop)).abs

  # This gets us from Park St to destination
  part2 = (subway_map[destination_line].index("park street") - subway_map[destination_line].index(destination_stop)).abs

  number_of_stops = part1 + part2

  "Traveling from #{origin_stop.capitalize} on the #{origin_line.capitalize} line to #{destination_stop.capitalize} on the #{destination_line.capitalize} line will take #{number_of_stops} stops."

end


# Display result to user
def display_result(origin_line,origin_stop,destination_line,destination_stop,number_of_stops)

  puts "Your Journey:"
  puts "Traveling from #{origin_stop} on the #{origin_line} line go to #{destination_stop} on the #{destination_line }will take #{number_of_stops} stops."
end

#program


puts line_logic(t_lines,get_origin_line,get_origin_stop,get_destination_line, get_destination_stop)
# puts display_result
