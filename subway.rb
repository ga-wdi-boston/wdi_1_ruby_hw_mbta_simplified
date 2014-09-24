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
            "redline"
      elsif train_lines[:greenline].include?(station)
            "greenline"
      elsif train_lines[:orangeline].include?(station)
            "orangeline"
      end
end

puts "Enter origin stop:"
origin_stop = gets.chomp
origin_line = get_line(train_lines, origin_stop).to_sym
puts "Enter destination stop:"
destination_stop = gets.chomp
destination_line = get_line(train_lines, destination_stop).to_sym

leg1 = (train_lines[origin_line].index(origin_stop) - train_lines[origin_line].index(intersection)).abs
leg2 = (train_lines[destination_line].index(intersection) - train_lines[destination_line].index(destination_stop)).abs
puts "Your trip is " + (leg1 + leg2).to_s + " stops long."
