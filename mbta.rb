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

# maybe an array of subway lines with stops collected in hashes for each line?

# FOUR USER INPUTS: origin_line, origin_stop, destination_line, destination_stop

puts "Let me tell you how many stops you will be traveling on this trip. Please supply me with the following information."

puts "Origin line: "
origin_line = gets.chomp.capitalize

puts "Origin stop: "
origin_stop = gets.chomp.capitalize

puts "Destination line: "
destination_line = gets.chomp.capitalize

puts "Destination stop: "
destination_stop = gets.chomp.capitalize


