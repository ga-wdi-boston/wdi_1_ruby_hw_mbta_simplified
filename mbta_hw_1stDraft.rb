require 'pry' #initialize pry
# First I will work on the prompt

#prompt
#origin line
puts "What line are you starting from?"
origin_line = gets.chomp.downcase

puts "What station are you starting from?"
origin_station = gets.chomp.downcase

puts "What line would you like to get to?"
destination_line = gets.chomp.downcase

puts "What stations would you like to get to?"
destination_station = gets.chomp.downcase

#Hash for lines

lines = {

    red_line: ["Alewife","Davis","Porter","Harvard","Central
      ","Kendall/MIT", "Park Street", "South Station"],

    # green_line: ["Haymarket", "Government Center", "Park Street"
    #   , "Boylston", "Arlington", "Copley"],

    # orange_line: ["North Station", "Haymarket",
    #   "Park", "State Street", "Downtown Crossing"
    #   , "Chinatown","Tufts Medical Center"]

    }

red_line_arr = lines[:red_line] #the hash address of the red_line array




binding.pry #call pry
