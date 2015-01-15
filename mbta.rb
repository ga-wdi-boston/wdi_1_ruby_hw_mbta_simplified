mbta = {
        red: {
          stations: [
            "Alewife",
            "Davis",
            "Porter",
            "Harvard",
            "Central",
            "Kendall/MIT",
            "Park Street",
            "South Station"
          ]
        },
        green: {
          stations: [
            "Haymarket",
            "Government Center",
            "Park Street",
            "Boylston",
            "Arlington",
            "Copley"
          ]
        },
        orange: {
          stations: [
            "North Station",
            "Haymarket",
            "Park Street",
            "State Street",
            "Downtown Crossing",
            "Chinatown",
            "Tufts"
          ]
        }
}

def calc_index_distance(array, index_a, index_b)
  ( array.index(index_a) - array.index(index_b) ).abs
end

def calc_stops(system, origin_line, origin, destination_line, destination)
  if origin_line == destination_line
    calc_index_distance(system[origin_line][:stations], origin, destination)
  else
    calc_index_distance(system[origin_line][:stations], origin, "Park Street") + calc_index_distance(system[destination_line][:stations], destination, "Park Street")
  end
end
