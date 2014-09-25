# ---------------- wdi_1_ruby_hw_mbta_simplified ----------------

=begin

Red Line
  Alewife
  Davis
  Porter
  Harvard
  Central
  Kendall/MIT
  Park Street
  South Station

Green Line
  Haymarket
  Government Center
  Park Street
  Boylston
  Arlington
  Copley

Orange Line
  North Station
  Haymarket
  Park Street
  State Street
  Downtown Crossing
  Chinatown
  Tufts Medical Center

SINGLE TRANSFER POINT: Park Street (Haymarket stops on Green Line and Orange Line are different, unconnected stops.)

FOUR USER INPUTS: origin_line, origin_stop, destination_line, destination_stop

## Instructions

Use methods to make your code better, with each method doing a single and small task if possible. Don't try to get too clever with methods however, and sometimes you simply need two separate methods to do two different tasks!

## Specifications

* Program has the subway system defined with appropriate data structures
* Program can find the distance between two stops on the same line
* Program can find the distance between two stops on different lines
* Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
* Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason - every line must intersect at a single common stop)
* Repository has several logical commits with descriptive messages
* Code uses correct indentation/style and descriptive variable names

=end

# ---------------- BEGIN CODE ----------------

require 'pry'

# def travel_distance(origin_line, origin_stop, destination_line, destination_stop)

#   if origin_line == destination_line



#   puts "You will be traveling #{travel_distance} stops in total." # where transfer is necessary, would also like to output number of stops to and from Park on each line, but not enough time.


# end


def get_user_line(on_or_off)
  if on_or_off == "origin"
    print "What is the color of the T line you are STARTING on: "
  end

  if on_or_off == "destination"
    print "\nWhat is the color of the T line you are ENDING on: "
  end
    gets.chomp.downcase

  # ideally should include a test for input validity, but am saving time
end

def get_user_stop
    print "\nYour stop number is: "
    gets.chomp.downcase

    # ideally should include a test for input validity, but am saving time
end


# thinking maybe there's a way to take user's selection and modify/shift arrays so that user's stop becomes 0 in the indices
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



# FOUR USER INPUTS: origin_line, origin_stop, destination_line, destination_stop

puts "\nLet me tell you how many T stops you'll need to travel on your ride.\n"

binding.pry

origin_line = get_user_line("origin")

# would like to create a method to do this so can just call the method in the main code, but couldn't figure it out in time. Guessing hash itself has to be its own separate method or class somehow?
all_origin_stops = mbta[origin_line.to_sym].map do |stop|
  i = mbta[origin_line.to_sym].index(stop)
  "Type #{i} for #{stop}."
end

puts all_origin_stops

origin_stop = get_user_stop

destination_line = get_user_line("destination")

puts "\nWhat specific #{destination_line.capitalize} Line stop you are getting OFF at.\n"
all_destination_stops = mbta[destination_line.to_sym].map do |stop|
  i = mbta[destination_line.to_sym].index(stop)
  "Type #{i} for #{stop}."
end

puts all_destination_stops

destination_stop = get_user_stop

binding.pry



