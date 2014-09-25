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

def list_stops(t_line_color)

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

puts "Let me tell you how many stops you will be traveling on this trip. Please supply me with the following information."

print "What is the color of the T line you are STARTING on: "
origin_line = gets.chomp.downcase
# ideally should include a test for input validity

puts "\nThank you. Next, please identiy the specific #{origin_line.capitalize} Line stop you are getting ON at.\n"

# would like to create a method to do this and then only need to call the method in the main code, but couldn't figure it out in the time I had. Main question is how to refer to mbta hash within the method -- guessing hash itself has to be incorporated in a separate method somehow?
all_origin_stops = mbta[origin_line.to_sym].map do |stop|
  i = mbta[origin_line.to_sym].index(stop)
  "Type #{i} for #{stop}."
end

puts all_origin_stops
print "What number is your stop? "
origin_stop = gets.chomp.to_i
# ideally should include a test for input validity

print "What is the color of the T line you are ENDING on: "
destination_line = gets.chomp.downcase
# ideally should include a test for input validity

puts "\nThank you. Next, please identiy the specific #{destination_line.capitalize} Line stop you are getting OFF at.\n"
all_destination_stops = mbta[origin_line.to_sym].map do |stop|
  i = mbta[origin_line.to_sym].index(stop)
  "Type #{i} for #{stop}."
end

puts all_destination_stops
print "What number is your stop? "
destination_stop = gets.chomp.to_i

binding.pry



