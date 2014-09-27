require 'pry'

class TeeRouter

  @@routes = {
    redline: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT","Charles/MGH","Park Street","Downtown Crossing","South Station", "Broadway", "Andrew", "JFK/UMASS", "Savin Hill"],
    greenlineB: ["Park Street","Boylston","Arlington","Copley","Hynes Convention Center", "Kenmore","Blandford Street","BU East", "BU Central", "BU West", "St. Paul Street", "Pleasant Street", "Babcock Street", "Packards Corner", "Harvard Avenue", "Griggs Street", "Allston Street", "Warren Street", "Washington Street", "Sutherland Road", "Chiswick Road", "Chestnut Hill Avenue", "South Street", "Boston College"],
    greenlineC: ["North Station","Haymarket","Government Center","Park Street","Boylston","Arlington","Copley","Hynes Convention Center", "Kenmore","St. Marys Street", "Hawes Street", "Kent Street", "St. Paul Street", "Coolidge Corner", "Summit Avenue", "Brandon Hall", "Fairbanks Street", "Washington Square", "Tappan Street", "Dean Road", "Englewood Avenue", "Cleveland Circle"],
    greenlineD: ["Park Street","Boylston","Arlington","Copley","Hynes Convention Center", "Kenmore","Fenway", "Longwood", "Brookline Village", "Brookline Hills", "Beaconsfield", "Reservoir", "Chestnut Hill", "Newton Centre", "Newton Highlands", "Eliot", "Waban", "Woodland", "Riverside"],
    greenlineE: ["Lechmere", "Science Park","North Station","Haymarket","Government Center","Park Street","Boylston","Arlington","Copley","Prudential", "Symphony", "Northeastern", "Museum of Fine Arts", "Longwood Medical Area", "Brigham Circle", "Fenwood Road", "Mission Park", "Riverway", "Back Of The Hill", "Heath"],
    orangeline: ["Oak Grove", "Malden Center", "Wellington", "Assembly","Sullivan Square", "Community College", "North Station","Haymarket","State","Downtown Crossing","Chinatown","Tufts Medical Center","Back Bay", "Mass Ave", "Ruggles", "Roxbury Crossing", "Jackson Square", "Stony Brook", "Green Street", "Forest Hills"],
    blueline: ["Bowdoin", "Government Center", "State","Aquarium", "Maverick", "Airport", "Wood Island", "Orient Heights", "Suffolk Downs", "Beachmont", "Revere Beach", "Wonderland"],
    silverline1: ["South Station", "Courthouse", "World Trade Center", "Silver Line Way", "Terminal A", "Terminal B", "Terminal C", "Terminal E"],
    connections: {
      park_street: [:redline,:greenlineB,:greenlineC,:greenlineD,:greenlineE],
      haymarket: [:greenlineC,:greenlineE,:orangeline],
      downtown_crossing: [:redline,:orangeline],
      north_station: [:greenlineC,:greenlineE,:orangeline],
      state: [:orangeline, :blueline],
      government_center: [:greenlineC, :greenlineE, :blueline],
      south_station: [:redline, :silverline]
    }
  }

  def initialize(string)
    parse_array(string.scan(/\b[\w\s\/]+/im)) # => ["...", "..."]
  end

  def parse_array(array)
    # TODO: make this parsing more eleganter. Measuring for 4 isn't the best way to check for goodness of the input
    good = array.length == 2 ? get_stations(array) :  directions("Invalid arrival and destination.")
  end

  def get_stations(array)
    origin = array[0].scan(/\b[a-z][\w\s\/]+/i)[0].split.map(&:capitalize)*' '
    destination = array[1].scan(/\b[a-z][\w\s\/]+/i)[0].split.map(&:capitalize)*' '
    origin.sub!(/[\/]+[A-Za-z]+/){ $&.upcase }
    destination.sub!(/([\/])\w+/){ $&.upcase }
    origin.sub!(/(?: *town)/i, "town")
    destination.sub!(/(?: *town)/i, "town")
    set_routes(origin, destination)
  end

  def set_routes(origin, destination)
    origin_line = get_route_line(origin)
    destination_line = get_route_line(destination)

    # i need these to be array, because a station could be on more than one line
    origin_line ? origin_line_name = get_route_name(origin_line) : "no origin line"
    destination_line ? destination_line_name = get_route_name(destination_line) : "no destination line"

    route(origin, origin_line_name, origin_line, destination, destination_line_name, destination_line)
  end

  def get_route_name(array)
    @@routes.key(array).to_s
  end

  def get_route_line(station)
    line = [] #=> need to check for more than one connection; arrays in array? or new hash?
    @@routes.each_pair { |key,value| value.include?(station) ? line = value.map{ |value| value } : false }
    return line
  end

  def route(origin,origin_line_name,origin_line,destination,destination_line_name,destination_line)
    if origin == destination
      result = "You want to get on and off at the same location? Doesn't sound like much of a trip to me..."
    elsif origin_line == destination_line
      result = "Get on the #{origin_line_name} line, ride it for #{(destination_line.index(destination)-origin_line.index(origin)).abs} stops, and get off at #{destination}"
    elsif origin_line != destination_line

      # I need to check the connections key hash for the connections. The connections key hash declares connection lines at the stations (keys), so if both the origin_line and the destination_line are in the same connection, I can use that station key as the connection
      origin_connections = []
      dest_connections = []
      @@routes[:connections].each_pair { |key, value| value.include?(origin_line_name.to_sym) ? origin_connections << key : false }
      @@routes[:connections].each_pair { |key, value| value.include?(destination_line_name.to_sym) ? dest_connections << key : false }

      # this will give us the connections of the origins and destinations in the form of an array.
      # it is possible that this array will not have a length, which means that you must change lines to get to where you want to go.
      combined_connections = origin_connections & dest_connections
      stringified_connections = combined_connections.map { |connection| connection.to_s.gsub!(/[_]/, " ") }
      stringified_connections.map! { |connection_string| connection_string.split.map!(&:capitalize)*' ' }

      binding.pry

      # if there's more than one way to make the connection, I need to find the connection with the least amount of stops
      # if two routes have the same amount of stops, i want to know that

    else
      directions("else is happening")
    end

    # (origin_line.index(origin) - origin_line.index(stringified_connections[1])).abs + (destination_line.index(destination) - destination_line.index(stringified_connections[1])).abs
    # if origin_line_name and destination_line_name are the same, calculate the distance between each index
    # if origin and destination lines are different loop through each line array, search for the same items, that's where the connection needs to happen
    # what if there's no connection to these lines? we need to find connections in one of the other lines through the connections key with the least stops
    directions(result)
  end

  def directions(result)
    puts result
  end

end

puts "Enter: departure station, arrival station"
TeeRouter.new(gets.chomp)












# this is not scalable because it hard-references Park Street as the connection, which might not always be the case
    # origin_line.index(origin) > origin_line.index("Park Street") ? origin_line_stops_to_get_off = origin_line[origin_line.index("Park Street")..origin_line.index(origin)].length - 1 : origin_line_stops_to_get_off = origin_line[origin_line.index(origin)..origin_line.index("Park Street")].length - 1
    # destination_line.index(destination) > destination_line.index("Park Street") ? destination_line_stops_to_get_off = destination_line[destination_line.index("Park Street")..destination_line.index(destination)].length - 1 : destination_line_stops_to_get_off = destination_line[destination_line.index(destination)..destination_line.index("Park Street")].length - 1

    # if origin == destination
    #   result = "You want to get on and off at the same location? Doesn't sound like much of a trip to me..."
    #   directions(result)
    # elsif line1 == line2
    #   result = "Get on the #{line1name} line, ride it for #{line2.index(destination)-line1.index(origin)} stops, and get off at #{line2name}"
    #   directions(result)
    # elsif line1 != line2
    #   # TODO: Add an inbound/outbound flag to the route
    #   line1.index(origin) > line1.index("Park Street") ? line1_stops_to_get_off = line1[line1.index("Park Street")..line1.index(origin)].length - 1 : line1_stops_to_get_off = line1[line1.index(origin)..line1.index("Park Street")].length - 1
    #   line2.index(destination) > line2.index("Park Street") ? line2_stops_to_get_off = line2[line2.index("Park Street")..line2.index(destination)].length - 1 : line2_stops_to_get_off = line2[line2.index(destination)..line2.index("Park Street")].length - 1
    #   result = "Get on the #{line1name} line at #{origin}, ride it for #{line1_stops_to_get_off} stops and get off at Park Street, change to the #{line2name} line, and ride it for #{line2_stops_to_get_off} stops towards #{destination}. You will have arrived at your destination."
    #   directions(result)
    # else
    #   result = "Something else happened"
    # end
