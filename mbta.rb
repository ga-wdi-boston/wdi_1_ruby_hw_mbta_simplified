puts "Please enter the train line you intend start:"
line_start = gets.chomp.downcase
puts "Please enter which stop you beginning your trip:"
stop_on = gets.chomp.downcase
puts "Almost done... Please enter which train line you indend to end your trip:"
line_end = gets.chomp.downcase
puts "Last question, please enter the name of the stop you indend to end your trip:"
stop_off = gets.chomp.downcase

hash = {
        "red line" => ["alewife", "davis", "porter", "harvard", "central", "kendall", "park street", "south station"],
        "green line" => ["haymarket", "government center", "park street", "boylston", "arlington", "copley"],
        "orange line" => ["north station", "haymarket", "park street", "state street", "downtown crossing", "chinatown", "tufts medical center"]
        }
if line_start == line_end
  start_index = (hash[line_start].index(stop_on))
  end_line_index = (hash[line_end].index(stop_off))
  puts "your will be there in #{(end_line_index - start_index).to_i.abs} stop(s)"
else
  start_index = (hash[line_start].index(stop_on))
  index_from_park = hash[line_start].index("park street")
  num_stops_to_park = (index_from_park - start_index).to_i.abs
  #know how far from park they are
  puts "you are #{num_stops_to_park} stop(s) to park street"

  end_index = (hash[line_end].index(stop_off))
  index_to_park = hash[line_end].index("park street")
  num_stops_from_park = (index_to_park - end_index).to_i.abs
#after transter how far from next stop on line they are
  puts "and from park street there are #{num_stops_from_park} stop(s) until you're there!"
  puts "So the total number of stops is: #{(num_stops_from_park + num_stops_to_park)}"
end





