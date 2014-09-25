require 'pry'

class TeeRouter

  @@routes = {
    redline: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT","Charles/MGH","Park Street","South Station"],
    greenline: ["Haymarket","Government Center","Park Street","Boylston","Arlington","Copley"],
    orangeline: ["North Station","Haymarket","Park Street","State Street","Downtown Crossing","China Town","Tufts Medical Center"]
  }

  def initialize(string)
    info = string.scan(/\b[\w\s\/]+/im) # => ["...", "...", "...", "..."]
    parse_array(info)
  end

  def parse_array(array)
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

    route(@@routes[origin_line.to_sym], origin,@@routes[destination_line.to_sym], destination, array)
  end

  def route(line1, origin, line2, destination, input)

    #---------------------------
    binding.pry #breakpoint
    #---------------------------

    if line1 == line2
      result = "Get on the #{input[0]} line, ride it for #{line2.index(destination)-line1.index(origin)} stops, and get off at #{input[-1]}"
    elsif origin == destination
      result = "You want to get on and off at the same location? Doesn't sound like much of a trip to me..."
    end

    #---------------------------
    binding.pry #breakpoint
    #---------------------------


  end

end

puts "Enter: departure line, departure station, arrival line, arrival station (comma separated values)"
TeeRouter.new(gets.chomp)

# redline, harvard, Red line, kendall/mit

=begin
Specifications
————————————————————————————————————————————————————————————————————
* Program has the subway system defined with appropriate data structures ##Done
* Program can find the distance between two stops on the same line ##Done
* Program can find the distance between two stops on different lines
* Program gives the correct distance in edge cases (e.g. route starts and ends at the same stop, route starts or ends at Park Street)
* Stops and lines can be added, removed, or rearranged in your code without making any changes to the route-finding logic (within reason – every line must intersect at a single common stop)
* Repository has several logical commits with descriptive messages
* Code uses correct indentation/style and descriptive variable names

=end
