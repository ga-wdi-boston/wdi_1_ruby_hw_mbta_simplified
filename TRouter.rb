# orangeline, tufts medical center, Green Line, Copley #=> Get on the orangeline line at Tufts Medical Center, ride it for 2 stops and get off at Park Street, change to the greenline line, and ride it for 3 stops towards Copley. You will have arrived at your destination.

require 'pry'

class TeeRouter

  @@routes = {
    redline: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT","Charles/MGH","Park Street","South Station", "Broadway", "Andrew", "JFK/UMASS", "Savin Hill"],
    greenline: ["North Station","Haymarket","Government Center","Park Street","Boylston","Arlington","Copley"],
    orangeline: ["North Station","Haymarket","State","Downtown Crossing","Park Street","China Town","Tufts Medical Center"]
  }

  def initialize(string)
    info = string.scan(/\b[\w\s\/]+/im) # => ["...", "...", "...", "..."]

    # --------------------
    binding.pry
    # --------------------

    parse_array(info)
  end

  def parse_array(array)

    # --------------------
    binding.pry
    # --------------------

    # TODO: make this parsing more eleganter. Measuring for 4 isn't the best way to check for goodness of the input
    good = array.length == 4 ? parse_trip(array) : "Invalid arrival and destination."
  end

  def parse_trip(array)
    origins = array.map.with_index{ |orig,i| i <= 1 ? orig : nil }.compact
    destinations = array.map.with_index{ |dest,i| i > 1 ? dest : nil }.compact

    #=> finds the first letter of the first index of all the items we need to work with
    origin_line = origins[0].scan(/\b[rog][\w\s]+/i)[0].gsub(/\s/, "").downcase
    destination_line = destinations[0].scan(/\b[rog][\w\s]+/i)[0].gsub(/\s/, "").downcase
    origin = origins[1].scan(/\b[a-z][\w\s\/]+/i)[0].split.map(&:capitalize)*' '
    destination = destinations[1].scan(/\b[a-z][\w\s\/]+/i)[0].split.map(&:capitalize)*' '
    origin.sub!(/[\/]+[A-Za-z]+/){ $&.upcase }
    destination.sub!(/[\/]+[A-Za-z]+/){ $&.upcase }

    # --------------------
    binding.pry
    # --------------------

    route(@@routes[origin_line.to_sym], origin_line, origin,@@routes[destination_line.to_sym], destination_line, destination,)

  end

  def route(line1,line1name,origin,line2,line2name,destination)
    if origin == destination
      result = "You want to get on and off at the same location? Doesn't sound like much of a trip to me..."
      directions(result)
    elsif line1 == line2
      result = "Get on the #{line1name} line, ride it for #{line2.index(destination)-line1.index(origin)} stops, and get off at #{line2name}"
      directions(result)
    elsif line1 != line2
      # TODO: Add an inbound/outbound flag to the route
      line1.index(origin) > line1.index("Park Street") ? line1_stops_to_get_off = line1[line1.index("Park Street")..line1.index(origin)].length - 1 : line1_stops_to_get_off = line1[line1.index(origin)..line1.index("Park Street")].length - 1
      line2.index(destination) > line2.index("Park Street") ? line2_stops_to_get_off = line2[line2.index("Park Street")..line2.index(destination)].length - 1 : line2_stops_to_get_off = line2[line2.index(destination)..line2.index("Park Street")].length - 1
      result = "Get on the #{line1name} line at #{origin}, ride it for #{line1_stops_to_get_off} stops and get off at Park Street, change to the #{line2name} line, and ride it for #{line2_stops_to_get_off} stops towards #{destination}. You will have arrived at your destination."
      directions(result)
    else
      result = "Something else happened"
    end

    # --------------------
    binding.pry
    # --------------------

  end

  def directions(result)
    print result
  end

end

puts "Enter: departure line, departure station, arrival line, arrival station (comma separated values)"
TeeRouter.new(gets.chomp)

=begin
Specifications
————————————————————————————————————————————————————————————————————
* Program has the subway system defined with appropriate data structures ##Done
* Program can find the distance between two stops on the same line ##Done
* Program can find the distance between two stops on different lines ## Done
* Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street) ## Done
* Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop) ##Done
* Repository has several logical commits with descriptive messages ##Done
* Code uses correct indentation/style and descriptive variable names ## Done

=end
