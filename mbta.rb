mbta =
{red_line: ["Alewife", "Davis", "Porter", "Harvard", "Central",
            "Kendall/MIT", "Park Street", "South Station"],
green_line: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
orange_line: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing",
"Chinatown", "Tufts Medical Center"]}

CROSSROADS = "Park Street" # intersection point of all lines

begin
  print("What is your origin line? ")
  origin_line = (gets.chomp.split[0].downcase + "_line").to_sym
  print("What is your origin stop? ")
  origin_stop = (gets.chomp.downcase.split.each { |word| word.capitalize!}).join(" ")
end while !(mbta[origin_line].index(origin_stop))

begin
  print("What is your destination line? ")
  destination_line = (gets.chomp.split[0].downcase + "_line").to_sym
  print("What is your destination stop? ")
  destination_stop = (gets.chomp.downcase.split.each { |word| word.capitalize!}).join(" ")
end while !(mbta[destination_line].index(destination_stop))

if origin_line == destination_line
  distance = (mbta[origin_line].index(origin_stop) - mbta[destination_line].index(destination_stop)).abs
else
  distance = (mbta[origin_line].index(origin_stop) - mbta[origin_line].index(CROSSROADS)).abs + (mbta[destination_line].index(destination_stop) - mbta[destination_line].index(CROSSROADS)).abs
end

puts "There are #{distance} stops between #{origin_stop} and #{destination_stop}."


