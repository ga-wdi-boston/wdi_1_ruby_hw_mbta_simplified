def getLine(trip_end)
  print("What is your #{trip_end} line? ")
  (gets.chomp.split[0].downcase + "_line").to_sym
end

def getStop(trip_end)
  print("What is your #{trip_end} stop? ")
  (gets.chomp.downcase.split.each { |word| word.capitalize!}).join(" ")
end

mbta =
{red_line: ["Alewife", "Davis", "Porter", "Harvard", "Central",
            "Kendall/MIT", "Park Street", "South Station"],
green_line: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
orange_line: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing",
"Chinatown", "Tufts Medical Center"]}

CROSSROADS = "Park Street" # intersection point of all lines

begin
  origin_line = getLine("origin")
  origin_stop = getStop("origin")
end while !(mbta[origin_line].index(origin_stop))

begin
  destination_line = getLine("destination")
  destination_stop = getStop("destination")
end while !(mbta[destination_line].index(destination_stop))

if origin_line == destination_line
  distance = (mbta[origin_line].index(origin_stop) - mbta[destination_line].index(destination_stop)).abs
else
  distance = (mbta[origin_line].index(origin_stop) - mbta[origin_line].index(CROSSROADS)).abs + (mbta[destination_line].index(destination_stop) - mbta[destination_line].index(CROSSROADS)).abs
end

puts "There are #{distance} stops between #{origin_stop} and #{destination_stop}."


