intersection = "Park Street"

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
            orangeline: [
                        "North Station",
                        "Haymarket",
                        "Park Street",  #intersection
                        "State Street",
                        "Downtown Crossing",
                        "Chinatown",
                        "Tufts Medical Center"
            ]
}

def get_line(train_lines, station)
      if train_lines[:redline].include?(station)
            puts "redline"
      elsif train_lines[:greenline].include?(station)
            puts "greenline"
      elsif train_lines[:orangeline].include?(station)
            puts "orangeline"
      end
end

puts "Enter origin line:"
origin_line = gets.chomp.to_sym
puts "Enter origin stop:"
origin_stop = gets.chomp
get_line(train_lines, origin_stop)
puts "Enter destination line:"
destination_line = gets.chomp.to_sym
puts "Enter destination stop:"
destination_stop = gets.chomp

leg1 = (train_lines[origin_line].index(origin_stop) - train_lines[origin_line].index(intersection)).abs
leg2 = (train_lines[destination_line].index(intersection) - train_lines[destination_line].index(destination_stop)).abs
puts leg1 + leg2
