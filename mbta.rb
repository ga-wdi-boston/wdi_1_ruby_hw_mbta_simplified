mbta_lines = {
  red_line:
    [
      "alewife",
      "davis",
      "porter",
      "harvard",
      "central",
      "kendallmit",
      "parkstreet",
      "southstation",
    ] ,
  green_line:
    [
    "haymarket",
    "governmentcenter",
    "parkstreet",
    "boylston",
    "arlington",
    "copley"
    ] ,
  orange_line:
    [
    "northstation",
    "haymarket",
    "parkstreet",
    "statestreet",
    "downtowncrossing",
    "chinatown",
    "tuftsmedicalcenter"
    ]
 }

line_options = [:red_line, :green_line, :orange_line]

origin_line = ""
until line_options.include? origin_line do
  print "Please choose your origin line: "
  origin_line = gets.downcase.tr(" ", "_").chomp.to_sym
end

origin_stop = ""
until mbta_lines[origin_line].include?(origin_stop) do
  print "Please choose your origin station: "
  origin_stop = gets.downcase.delete(" ").delete("/").chomp
end

destination_line = ""
until line_options.include? destination_line do
  print "Please choose your destination line: "
  destination_line = gets.downcase.tr(" ", "_").chomp.to_sym
end

destination_stop = ""
until mbta_lines[destination_line].include?(destination_stop) do
  print "Please choose your destination station: "
  destination_stop = gets.downcase.delete(" ").delete("/").chomp
end

stops_to_travel = 0
if origin_line == destination_line
  if origin_stop == destination_stop
    puts "You're already there!"
  else
   stops_to_travel = (mbta_lines[origin_line].index(origin_stop) - mbta_lines[destination_line].index(destination_stop))
   puts "You have to travel #{stops_to_travel.abs} stops."
  end
else
  stops_to_travel = (mbta_lines[origin_line].index(origin_stop) - mbta_lines[origin_line].index("parkstreet")).abs + (mbta_lines[destination_line].index(destination_stop) - mbta_lines[destination_line].index("parkstreet")).abs
  puts "You have to travel #{stops_to_travel} stops."
end
