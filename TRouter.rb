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

  # park street, downtown crossing, and south station connect the redline
  # state and government center connect the blue line

  # collect the unique stations in a new hash
  # for each key,value pair, match the stations that connect the same lines

  # out of this group, if there are any other values in the array that match any of the other keys, then we have a connecting station

  # park_street: [:redline,:greenlineB,:greenlineC,:greenlineD,:greenlineE],
  # downtown_crossing: [:redline,:orangeline],
  # south_station: [:redline, :silverline],
  # state: [:orangeline, :blueline],
  # government_center: [:greenlineC, :greenlineE, :blueline]

  def initialize(string)
    parse_array(string.scan(/\b[\w\s\/]+/im)) # => ["...", "..."]
  end

  def parse_array(array)
    # TODO: make this parsing more eleganter. Measuring for 2 isn't the best way to check for goodness of the input
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
    # ——————————————————————————————————————————————————
    # First we pass the origins lines into a hash, because the origin might have multiple connecting lines
    # Second we pass in the destinations lines into a hash, because the destination might have multiple connecting lines
    # Then we see if both hashes have matching keys, meaning they're on the same line.
    # If they don't have matching keys, that means they're on different lines, and we need to find the connecting station
    # ——————————————————————————————————————————————————
    origin_lines = get_route_line(origin)
    destination_lines = get_route_line(destination)
    single_line = {}
    origin_lines.each_pair { |key, value| destination_lines.has_key?(key) ? single_line.store(key,value) : nil }
    single_line.empty? ? get_connections(origin, destination, origin_lines, destination_lines) : set_single_line(origin, destination, single_line)
  end

  def get_connections(origin, destination, origin_lines, destination_lines)

    # ——————————————————————————————————————————————————
    # This method gets run when there's no single line we can ride and we have to change lines.
    # First, we declare the arrays we'll have to work with.
    # Second, we look at each key/value pair in the connections, and stringify them for matching against our line array values
    # Then, we look at each key/value pair in the origin_lines, and for each pair, we loop through the connections and see if there are any matches between the origin's lines and the connecting stations.
    # Essentially what this does is find the connecting station(s) on the origin's lines
    # We then look for connecting stations in the destination lines.
    # Once we have the connecting stations, we match them and put the matches into a single array. If this array has a length > 0, that means we can connect at a single station: (take line_a, get off at connecting station, take line_b to destination).
    # If matched_connections has a length that == 0, that means there are no stations that connect, and we have to find the connecting line.
    # It's quite possible that matched_connections will have more than 1 element in the array. for instance, harvard to north station has 2 matching connections (redline to greenline,  redline to orangeline)
    # we probably want to find the connection with the least amount of stops. if all the connections have the same amount of stops, we need to know that too.
    # It's also possible that an indirect connection (changing lines twice) is more efficient than changing trains once (ie Copley to Ruggles is more efficient by Greenline to Redline to Orangeline)
    # ——————————————————————————————————————————————————
    origin_connections = []
    dest_connections = []
    connections_to_strings = []

    @@routes[:connections].each_pair { |key, value| key.to_s =~ /[_]/ ? connections_to_strings << key.to_s.gsub!(/[_]/, " ").split.map(&:capitalize)*' ' : connections_to_strings << key.to_s.capitalize  }
    origin_lines.each_pair { |key, value| connections_to_strings.each { |connection| value.include?(connection) ? origin_connections << connection : nil } }
    destination_lines.each_pair { |key, value| connections_to_strings.each { |connection| value.include?(connection) ? dest_connections << connection : nil } }
    unique_origin_connections = origin_connections.uniq
    unique_destination_connections = dest_connections.uniq

    matched_connections = unique_origin_connections & unique_destination_connections

    # to match a connecting train line between our origin and destination (changing trains twice)
    # 1. we have to find a matching station for our origin,
    # 2. then find a matching station for our destination
    # these connections have already been declared in our @@routes[:connections] hash

    # out of the unique origin connections, are there any lines that connect out of those key/value pairs,


    # ——————————————————————————————————————————————————
    binding.pry
    # ——————————————————————————————————————————————————



    matched_connections.length > 0 ? set_direct_connection(origin, destination) : set_connecting_route()

  end

  # helper method to turn the @@routes keys to strings
  def get_route_name(array)
    @@routes.key(array).to_s
  end

  def get_route_line(station)
    lines = {}
    @@routes.each_pair { |key,value| value.include?(station) ? lines.store(key, value) : false }
    return lines
  end

  def set_single_line(origin, destination, single_line_hash)
    # if single_line_hash has more than one key/value pair, it means that multiple train lines can get you to where you're going without changing lines
    puts "you don't have to change trains"
  end

  def set_direct_connection(origin,destination)
    puts "you have to change lines once"
  end

  def set_connecting_route()
    puts "you have to change lines more than once"
  end

  def directions(result)
    puts result
  end

end

puts "Enter: departure station, arrival station"
TeeRouter.new(gets.chomp)
