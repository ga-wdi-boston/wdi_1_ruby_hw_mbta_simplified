mbtamap = {
  "Red Line" =>[
    "Alewife",
    "Davis",
    "Porter",
    "Harvard",
    "Central",
    "Kendall/MIT",
    "Park Street",
    "South Station"
  ],
  "Green Line" => [
    "Haymarket",
    "Government Center",
    "Park Street",
    "Boylston",
    "Arlington",
    "Copley"
  ],
  "Orange Line" => [
    "North Station",
    "Haymarket",
    "Park Street",
    "State Street",
    "Downtown Crossing",
    "Chinatown",
    "Tufts Medical Center"
  ]
}

vortex = "Park Street"

def prompt_menu(title, options)
  puts title
  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option}" 
  end
  while true
    user_input = gets.chomp.to_i
    if user_input > 0 && user_input <= options.count
      return user_input - 1
    end
    puts "Not a valid option, try again"
  end
end

def get_stop(dir, mbtamap)
  line = prompt_menu "Enter #{dir} line", mbtamap.keys
  line_name = mbtamap.keys[line]
  stops = mbtamap[line_name]
  stop = prompt_menu "Enter #{dir} stop", stops
  return {
    line: line_name,
    stop: stops[stop],
    stop_index: stop
  } 
end

def dist_on_line(stop_index_a, stop_index_b)
  (stop_index_a - stop_index_b).abs
end


def dist_to_vortex(stop_index, vortex, stops)
  dist_on_line(stops.index(vortex), stop_index)  
end

origin = get_stop("origin", mbtamap)
destination = get_stop("destination", mbtamap)

if origin[:line] == destination[:line]
  dist = dist_on_line(origin[:stop_index], destination[:stop_index])
else
  dist = dist_to_vortex(origin[:stop_index], vortex, mbtamap[origin[:line]])
  dist += dist_to_vortex(destination[:stop_index], vortex, mbtamap[destination[:line]])
end

puts "The number of stops for your trip is #{dist}"





