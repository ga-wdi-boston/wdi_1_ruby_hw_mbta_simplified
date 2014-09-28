require 'pry'

# ---------------- GLOBAL METHODS ----------------

def get_user_stop(mbta, on_or_off)
  if on_or_off == "origin"
    print "\nWhat is the color of the T line you are STARTING on: "
  elsif on_or_off == "destination"
    print "\nWhat is the color of the T line you are ENDING on: "
  end

  user_line = gets.chomp.downcase
  # should include a test for input validity, but do other stuff first

  mbta[user_line.to_sym].each_with_index do |stop, index|
    puts "Type #{index} for #{stop}."
  end

  print "\nYour stop number is: "
  user_stop = gets.chomp.to_i
  # should include a test for input validity, but do other stuff first

  return user_line, user_stop
end

def travel_distance(mbta, origin, destination)

  if origin[0] == destination[0]
    num_stops = (origin[1] - destination[1]).abs

  elsif origin[0] != destination[0]
    num_stops = (origin[1] - mbta[origin[0].to_sym].index("Park Street")).abs + (destination[1] - mbta[destination[0].to_sym].index("Park Street")).abs
  end

  if num_stops == 1
    puts "\nYou will only have to travel #{num_stops} stop on your trip!"
  elsif num_stops == 0
    puts "0 stops. It seems that you don't have an immediate need to use the T."
  elsif mbta[origin[0].to_sym][origin[1]] == "Park Street" || mbta[destination[0].to_sym][destination[1]] == "Park Street"
    puts "You will have to travel #{num_stops} stops total."

  elsif num_stops > 0 && mbta[origin[0].to_sym][origin[1]] != "Park Street" && mbta[destination[0].to_sym][destination[1]] != "Park Street"
    puts "\nYou will have to travel #{(origin[1] - mbta[origin[0].to_sym].index("Park Street")).abs} stop(s) to Park Street, then transfer to the #{destination[0].capitalize} Line and travel #{(destination[1] - mbta[destination[0].to_sym].index("Park Street")).abs} more stop(s) to #{mbta[destination[0].to_sym][destination[1]]}. That's a total of #{num_stops} stops.\n"
  end
end



# --------- DATA COLLECTIONS ---------

mbta = {
  red: [
    "Alewife",
    "Davis",
    "Porter",
    "Harvard",
    "Central",
    "Kendall/MIT",
    "Park Street",
    "South Station"
  ],

  green: [
    "Haymarket",
    "Government Center",
    "Park Street",
    "Boylston",
    "Arlington",
    "Copley"
  ],

  orange: [
    "North Station",
    "Haymarket",
    "Park Street",
    "State Street",
    "Downtown Crossing",
    "Chinatown",
    "Tufts Medical Center"],
}


# ---------------- MAIN CODE ----------------

puts "\nLet me tell you how many T stops you'll need to travel on your ride.\n"

# binding.pry

origin = get_user_stop(mbta, "origin") # => Returns array [line_color_string, stop_integer]

destination = get_user_stop(mbta, "destination") # => Returns array [line_color_string, stop_integer]

travel_distance(mbta, origin, destination)

# binding.pry
