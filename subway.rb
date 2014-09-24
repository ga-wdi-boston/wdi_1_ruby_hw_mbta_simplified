train_lines = {
            redline: [
                        "Alewife",
                        "Davis",
                        "Porter",
                        "Harvard",
                        "Central",
                        "Kendall/MIT",
                        "Park Street",   #intersection
                        "South Station"
            ],
            greenline: [
                        "Haymarket",
                        "Government Center",
                        "Park Street",  #intersection
                        "Boylston",
                        "Arlington",
                        "Copley"
            ],
            northstation: [
                        "Haymarket",
                        "Park Street",  #intersection
                        "State Street",
                        "Downtown Crossing",
                        "Chinatown",
                        "Tufts Medical Center"
            ]
}

puts "Enter origin line:"
origin_line = gets.chomp.to_sym
puts "Enter origin stop:"
origin_stop = gets.chomp
puts "Enter destination line:"
destination_line = gets.chomp.to_sym
puts "Enter destination stop:"
destination_stop = gets.chomp

puts train_lines[origin_line].index(origin_stop) - train_lines[origin_line].index(origin_stop)

