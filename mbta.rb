mbta_lines = {
  red_line:
    {
      alewife: 6,
      davis: 5,
      porter: 4,
      harvard: 3,
      central: 2,
      kendallmit: 1,
      parkstreet: 0,
      southstation: 1,
    } ,
  green_line:
    {
    haymarket: 2,
    governmentcenter: 1,
    parkstreet: 0,
    boylston: 1,
    arlington: 2,
    copley: 3
    } ,
  orange_line:
    {
    northstation: 2,
    haymarket: 1,
    parkstreet: 0,
    statestreet: 1,
    downtowncrossing: 2,
    chinatown: 3,
    tuftsmedicalcenter: 4
    }
 }

line_options = [:red_line, :green_line, :orange_line]

origin_line = ""
until line_options.include? origin_line do
  print "Please choose your origin line: "
  origin_line = gets.downcase.tr(" ", "_").chomp.to_sym
end

origin_stop = ""
until mbta_lines[origin_line].has_key?(origin_stop) do
  print "Please choose your origin station: "
  origin_stop = gets.downcase.delete(" ").delete("/").chomp.to_sym
end

destination_line = ""
until line_options.include? destination_line do
  print "Please choose your destination line: "
  destination_line = gets.downcase.tr(" ", "_").chomp.to_sym
end

destination_stop = ""
until mbta_lines[destination_line].has_key?(destination_stop) do
  print "Please choose your destination station: "
  destination_stop = gets.downcase.delete(" ").delete("/").chomp.to_sym
end
