require 'pry'

class TeeRouter

  @@routes = {
    redline: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT","Charles/MGH","Park Street","South Station"],
    greenline: ["Haymarket","Government Center","Park Street","Boylston","Arlington","Copley"],
    orangeline: ["North Station","Haymarket","Park Street","State Street","Downtown Crossing","China Town","Tufts Medical Center"]
  }

  def initialize(string)
    info = string.scan(/\b[\w\s\/]+/im) # => ["...", "...", "...", "..."]

    #---------------------------
    binding.pry #breakpoint
    #---------------------------

    parse_array(info)

  end

  def parse_array(array)
    good = array.length == 4 ? parse_trip(array) : "Invalid arrival and destination."

    #---------------------------
    binding.pry #breakpoint
    #---------------------------

  end

  def parse_trip(array)
    origins = array.map.with_index{ |orig,i| i <= 1 ? orig : nil }.compact
    destinations = array.map.with_index{ |dest,i| i > 1 ? dest : nil }.compact

    # origins[0].scan(/\b[rog]/) #=> finds the first letter of the first index of origin (the departure line) to match against

    # determine if origin and destination are the same, if not calculate how many stops (indeces) from origin to park for transfer
    red_start = origins[0].scan(/\b[r]/i).length ? @@routes[:redline].index(origins[1]) : nil
    green_start = origins[0].scan(/\b[g]/i).length ? @@routes[:greenline].index(origins[1]) : nil
    orange_start = origins[0].scan(/\b[o]/i).length ? @@routes[:orangeline].index(origins[1]) : nil

    red_end = destinations[0].scan(/^[r]/i).length ? @@routes[:redline].index(destinations[1]) : nil
    green_end = destinations[0].scan(/^[g]/i).length ? @@routes[:greenline].index(destinations[1]) : nil
    orange_end = destinations[0].scan(/^[o]/i).length ? @@routes[:orangeline].index(destinations[1]) : nil

    same_line(red_start, red_end, array) if red_start && red_end
    same_line(green_start, green_end, array) if green_start && green_end
    same_line(orange_start, orange_end, array) if orange_start && green_end

  end

  def same_line(start_station,end_station,array)
    #---------------------------
    binding.pry #breakpoint
    #---------------------------
    puts "Get on the #{array[0]} at #{array[1]} station, ride for #{end_station - start_station} stop(s) and get off at #{array[-1]}"
  end

  def with_stops(origs,dests)
    # logic goes here to calculate the number of stops between 2 lines

    #---------------------------
    binding.pry #breakpoint
    #---------------------------

    puts "Tough shit kiddo. Gotta change trains at park street"

  end

end

puts "Enter: departure line, departure station, arrival line, arrival station (comma separated values)"
TeeRouter.new(gets.chomp)

# red line, Harvard, Redline, Central

=begin
Specifications
————————————————————————————————————————————————————————————————————
* Program has the subway system defined with appropriate data structures ##Done
* Program can find the distance between two stops on the same line
* Program can find the distance between two stops on different lines
* Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
* Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)
* Repository has several logical commits with descriptive messages
* Code uses correct indentation/style and descriptive variable names

=end
