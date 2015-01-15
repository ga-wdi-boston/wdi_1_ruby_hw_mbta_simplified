# Charlie on the MTA
require "pry"

red = {
  "Alewife" => 1,
  "Davis" => 2,
  "Porter" => 3,
  "Harvard" => 4,
  "Central" => 5,
  "Kendall_MIT" => 6,
  "Park_Street" => 7,
  "South_Station" => 8
}

green = {
  "Haymarket" => 1,
  "Government_Center" => 2,
  "Park_Street" => 3,
  "Boylston" => 4,
  "Arlington" => 5,
  "Copley" => 6
}

orange = {
  "North Station" => 1,
  "Haymarket" => 2,
  "Park Street" => 3,
  "State Street" => 4,
  "Downtown Crossing" => 5,
  "Chinatown" => 6,
  "Tufts Medical Center" => 7
}

#total_sta_count = 0

def find_sta_num(line, station_name)
  return line[station_name]
end

#originating train line: red, Alewife
puts("originating train line and station are: red, Alewife")
my_start_line = red
my_start_sta = "Alewife"

#use find_sta_num method to return station number
sta_num_a = find_sta_num(my_start_line, my_start_sta) #1

#terminating train line: green, Copley
puts("terminating train line and station are: green, Copley")
my_end_line = green
my_end_sta = "Copley"

#use find_sta_num method to return station number
sta_num_b = find_sta_num(my_end_line, my_end_sta) #2

#create tally array, used for tallying station totals
tally = []

#If start_line and end_line are the SAME train line, add the difference to a new element of the tally array
if my_start_line == my_end_line
  tally.push((sta_num_a - sta_num_b).abs)
else #if start_line and end_line are a DIFFERENT train line ...
  # find difference of starting line station to starting line Park Street & push to tally array
  sta_num_a = find_sta_num(my_start_line, my_start_sta) #1
  park_street_start = my_start_line["Park_Street"] #7
  tally.push((sta_num_a - park_street_start).abs) #6
  puts("Adding to subtotal: #{tally.first}")

  # find difference of ending line station to ending line Park Street & push to tally array
  sta_num_b = find_sta_num(my_end_line, my_end_sta) #6
  park_street_end = my_end_line["Park_Street"] #3
  tally.push((sta_num_b - park_street_end).abs) #3
  puts("Adding to subtotal: #{tally.last}")
end

grand_total = tally.reduce(:+)

# binding.pry
puts("The total number of stations is: #{grand_total}")


