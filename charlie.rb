require 'pry'

# Here is the map of the MBTA

t_lines = {
          red: [
            "alewife",
            "davis",
            "porter",
            "harvard",
            "central",
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

# The next four methods get user input:

def get_origin_line

  puts "I'll tell you how to go where you want to go on the MBTA!"
  puts "On which line will you originate? \n -Red \n -Orange \n -Green"
  origin_line = gets.chomp.downcase.to_sym

end

def get_origin_stop

  puts "What's your origin stop?"
  origin_stop = gets.chomp.downcase

end

def get_destination_line

  puts "On which line is your destination? \n -Red \n -Orange \n -Green"
  destination_line = gets.chomp.downcase.to_sym

end

def get_destination_stop

  puts "What's your destination stop?"

  destination_stop = gets.chomp.downcase
end

# Computation occurs in this method:

def line_logic(subway_map,origin_line,origin_stop,destination_line,destination_stop)

  if origin_line == destination_line

    # If origin and destination are on the same line:

    number_of_stops = (subway_map[origin_line].index(origin_stop) - subway_map[destination_line].index(destination_stop)).abs

  else
    # If origin and destination are on different lines
    # This gets the rider from the origin to Park Street:

    part1 = (subway_map[origin_line].index("park street") - subway_map[origin_line].index(origin_stop)).abs

    # This gets the rider from Park Street to the destination:
    part2 = (subway_map[destination_line].index("park street") - subway_map[destination_line].index(destination_stop)).abs

    number_of_stops = part1 + part2

  end

end

# This displays the result to user:

def display_result(number_of_stops)

  puts "Your Journey will take #{number_of_stops} stops."

end


display_result(line_logic(t_lines,get_origin_line,get_origin_stop,get_destination_line,get_destination_stop))
