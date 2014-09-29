require 'pry'

class TeeRouter

  @@routes = {
    redlineA: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT","Charles/MGH","Park Street","Downtown Crossing","South Station", "Broadway", "Andrew", "JFK/UMASS", "Savin Hill","Fields Corner","Shawmut","Ashmont"],
    redlineB: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT","Charles/MGH","Park Street","Downtown Crossing","South Station", "Broadway", "Andrew", "JFK/UMASS", "North Quincy", "Wollaston", "Quincy Center", "Quincy Adams","Braintree"],
    greenlineB: ["Park Street","Boylston","Arlington","Copley","Hynes Convention Center", "Kenmore","Blandford Street","BU East", "BU Central", "BU West", "St. Paul Street", "Pleasant Street", "Babcock Street", "Packards Corner", "Harvard Avenue", "Griggs Street", "Allston Street", "Warren Street", "Washington Street", "Sutherland Road", "Chiswick Road", "Chestnut Hill Avenue", "South Street", "Boston College"],
    greenlineC: ["North Station","Haymarket","Government Center","Park Street","Boylston","Arlington","Copley","Hynes Convention Center", "Kenmore","St. Marys Street", "Hawes Street", "Kent Street", "St. Paul Street", "Coolidge Corner", "Summit Avenue", "Brandon Hall", "Fairbanks Street", "Washington Square", "Tappan Street", "Dean Road", "Englewood Avenue", "Cleveland Circle"],
    greenlineD: ["Park Street","Boylston","Arlington","Copley","Hynes Convention Center", "Kenmore","Fenway", "Longwood", "Brookline Village", "Brookline Hills", "Beaconsfield", "Reservoir", "Chestnut Hill", "Newton Centre", "Newton Highlands", "Eliot", "Waban", "Woodland", "Riverside"],
    greenlineE: ["Lechmere", "Science Park","North Station","Haymarket","Government Center","Park Street","Boylston","Arlington","Copley","Prudential", "Symphony", "Northeastern", "Museum Of Fine Arts", "Longwood Medical Area", "Brigham Circle", "Fenwood Road", "Mission Park", "Riverway", "Back Of The Hill", "Heath"],
    orangeline: ["Oak Grove", "Malden Center", "Wellington", "Assembly","Sullivan Square", "Community College", "North Station","Haymarket","State","Downtown Crossing","Chinatown","Tufts Medical Center","Back Bay", "Mass Ave", "Ruggles", "Roxbury Crossing", "Jackson Square", "Stony Brook", "Green Street", "Forest Hills"],
    blueline: ["Bowdoin", "Government Center", "State","Aquarium", "Maverick", "Airport", "Wood Island", "Orient Heights", "Suffolk Downs", "Beachmont", "Revere Beach", "Wonderland"],
    silverline1: ["South Station", "Courthouse", "World Trade Center", "Silver Line Way", "Terminal A", "Terminal B", "Terminal C", "Terminal E"],
    connections: {
      park_street: [:redlineA, :redlineB,:greenlineB,:greenlineC,:greenlineD,:greenlineE],
      haymarket: [:greenlineC,:greenlineE,:orangeline],
      boylston: [:greenlineB, :greenlineC, :greenlineD, :greenlineE],
      arlington: [:greenlineB, :greenlineC, :greenlineD, :greenlineE],
      copley: [:greenlineB, :greenlineC, :greenlineD, :greenlineE],
      hynes_convention_center: [:greenlineB, :greenlineC, :greenlineD],
      kenmore: [:greenlineB, :greenlineC, :greenlineD],
      downtown_crossing: [:redlineA, :redlineB,:orangeline],
      north_station: [:greenlineC,:greenlineE,:orangeline],
      state: [:orangeline, :blueline],
      government_center: [:greenlineC, :greenlineE, :blueline],
      south_station: [:redlineA,:redlineB, :silverline]
    }
  }

  def initialize(string)
    parse_array(string.scan(/\b[\w\s\/]+/im)) # => ["...", "..."]
  end

  # Take in the input, convert it to readable arrays
  def parse_array(array)
    # TODO: make this parsing more eleganter. Measuring for 2 isn't the best way to check for goodness of the input
    good = array.length == 2 ? get_stations(array) :  directions("Invalid arrival and destination.")
  end

  # converts the array of items into an origin and destination readable by ruby
  def get_stations(array)
    origin = array[0].scan(/\b[a-z][\w\s\/]+/i)[0].split.map(&:capitalize)*' '
    destination = array[1].scan(/\b[a-z][\w\s\/]+/i)[0].split.map(&:capitalize)*' '
    origin.sub!(/[\/]+[A-Za-z]+/){ $&.upcase }
    destination.sub!(/([\/])\w+/){ $&.upcase }
    origin.sub!(/(?: *town)/i, "town")
    destination.sub!(/(?: *town)/i, "town")

    # TODO: search our @@routes hash for the origin and destination, kick out if either invalid
    set_routes(origin, destination)
  end

  # This block sends out the station names, and returns a hash of lines the stations are members of.
  # Then calls get_connections with the returned values
  def set_routes(origin, destination)
    origin_lines = get_route_line(origin)
    destination_lines = get_route_line(destination)
    get_connections(origin, destination, origin_lines, destination_lines)
  end

  # match the @@routes class variable with the origin's and destination's available lines.
  def get_connections(origin, destination, origin_lines, destination_lines)
    origin_connections = []
    dest_connections = []
    connections_to_strings = []
    # stringifies the connection keys and passes them into connections_to_strings, for matching against the actual station names in the lines
    @@routes[:connections].each_pair { |key, value| connections_to_strings << convert_to_connection_string(key) }
    origin_lines.each_pair { |key, value| connections_to_strings.each { |connection| value.include?(connection) ? origin_connections << connection : nil } }
    destination_lines.each_pair { |key, value| connections_to_strings.each { |connection| value.include?(connection) ? dest_connections << connection : nil } }
    filter_connections(origin,destination, origin_lines, destination_lines, origin_connections, dest_connections)
  end

  # find all the unique stations that connect to other stations.
  # If origin & destination share connecting stations, they have common_unique_connections
  # If the origin and destination don't share common_unique_connections, they share uncommon_unique_connections, meaning you have the change lines twice (call Über)
  def filter_connections(origin, destination, origin_lines, destination_lines,origin_connections, dest_connections)

    # filter out the excess, only want unique origin and destination connections
    unique_origin_connections = origin_connections.uniq
    unique_destination_connections = dest_connections.uniq

    # common_unique_connections takes the intersecting elements from both the origin and unique destination.
    # if this exists and has values, then we know that the two stops both share a connecting station, which makes our routing easy (origin > connection > destination)
    common_unique_connections = unique_origin_connections & unique_destination_connections

    # if uncommon_unique_connections exists and has lengths, it means that there is no direct connection between the station, and
    # we need to find a connecting LINE that connects the origin and destination (two stations)
    uncommon_unique_connections = []

    # add the origin and destination together to get all the stations that connect to other lines along the origin and destination lines
    common_unique_connections.length == 0 ? uncommon_unique_connections = unique_origin_connections + unique_destination_connections : false
    # convert_to_connection_symbol isn't going to work properly, don't want downcasing on my symbols (greenlineE, greenlineC, redlineB, etc...)
    uncommon_unique_connections.length ? uncommon_unique_symbols = uncommon_unique_connections.map{ |connection| convert_to_connection_symbol(connection) } : false

    # call route with all of the parameters
    route(origin, destination, origin_lines, destination_lines, common_unique_connections,uncommon_unique_connections, uncommon_unique_symbols)
  end

  # initial logic to find the uncommon connections. NEEDS WORK
  def match_connections(common_unique_connections, uncommon_unique_symbols)
    # we then match the uncommon unique connections to the @@routes[:connections] keys,
    # and take only the connections that are on our origin and destination lines
    matched_connections = {}
    @@routes[:connections].each_pair { |key, value| uncommon_unique_symbols.each { |connection| connection == key ? matched_connections.store(key,value) : false } }
    matched_connection_values = matched_connections.values
    connects_with = {}
    matched_connections.each_pair do |key,value|
      connections = matched_connection_values.map { |collection|
        if collection != value #=> don't match against itself, we're looking for connecting lines to our matched connections that exist on our origin and destination lines
          # returns out all of the connections between the common connecting stations if there are any
          eval_common_elements(value,collection).length != 0 ? connects_with.store([key, matched_connections.key(collection)],eval_common_elements(value, collection)) : false
        end
      }
    end
  end

  # meat and potatoes.
  def route(origin, destination, origin_lines, destination_lines, common_unique_connections, uncommon_unique_connections, uncommon_unique_symbols)

    if origin == destination
      result = "Just walk. Don't be lazy."
      directions(result)
      return
    end

    # are the origin and destination on the same line?
    on_same_line = false
    origin_lines.each_pair { |ok,ov|
      destination_lines.each_pair { |dk, dv|
        if ok == dk
          on_same_line = true
          break
        end
      }
    }
    if on_same_line #=> origin and destination are on the same line
      # what if there is more than 1 line that connect the two stations, even if they're on the same line?
      # for instance, park street to north station are on the same line twice (greenlineC, greenlineE)
      result ||= ""
      num_origin_destination_lines = {}
      common_unique_connections.each { |connection| origin_lines.each_pair { |k,v| v.include?(destination) ? num_origin_destination_lines.store(k, distance_between(origin,destination,v)) : false } }
      result << "You can get to #{destination} from #{origin} #{num_origin_destination_lines.length} way(s):\n————————————————————————————\n"
      num_origin_destination_lines.each_pair { |k,v| result << "Take the #{convert_to_connection_string(k)} for #{v} stop(s) and get off at #{destination}\n" }
      directions(result)
    else #=> origin and destination not on the same line
      # declare result if it doesn't exist
      result ||= ""
      if common_unique_connections.length > 0 #=> if our origin and destination share a connection (1 stop)
        num_routes = common_unique_connections.length # the number of shared unique connections between the two stops
        num_origin_to_connection_stops = {} # hash of keys(stations) and the number of stops from the origin to the connecting station
        num_connection_to_destination_stops = {} # hash of keys(stations) and the number of stops from the connecting station to the destination
        origin_to_connection_lines = [] # array of arrays to hold: connecting station, stops, and line to take
        connection_to_destination_line = [] # array of arrays to hold: connecting station, stops, and line to take

        # TODO: move this duplicated code into a method and pass in arguments
        common_unique_connections.each.with_index do |connection, index|
          origin_lines.each_pair do |k,v|
            v.include?(connection) ? num_origin_to_connection_stops.store(connection, distance_between(connection,origin, v))  : false
            v.include?(connection) ? origin_to_connection_lines << [connection,distance_between(connection,origin, v),k] : false
          end
          destination_lines.each_pair do |k,v|
            v.include?(connection) ? num_connection_to_destination_stops.store(connection, distance_between(connection, destination,v)) : false
            v.include?(connection) ? connection_to_destination_line << [connection, distance_between(connection, destination, v),k] : false
          end
        end

        dir_origin_to_connection = "\n\nYou have to connect. Your shortest connection options:\n————————————————————————————————————————————————————————\n"
        dir_connection_to_destination = "\nYour shortest connection to destination options:\n————————————————————————————————————————————————————————\n"

        origin_stops = []
        num_origin_to_connection_stops.each_pair { |k, v| origin_stops << v }
        shortest_origin_to_connect_stops = num_origin_to_connection_stops.select {|k,v| v == origin_stops.min || v == (origin_stops.min) + 1 }
        dest_stops = []
        num_connection_to_destination_stops.each_pair { |k,v| dest_stops << v }
        shortest_connect_to_dest_stops = num_connection_to_destination_stops.select { |k,v| v == dest_stops.min || v == (dest_stops.min) + 1 }

        # TODO: Push these blocks out into their own method. Repetitive
        shortest_origin_to_connect_stops.each_pair { |ok,ov| #=>  for state {"Haymarket"=>1, "North Station"=>2, "Government Center"=>1}
            shortest_connect_to_dest_stops.each_pair { |dk, dv| #=> for lechmere {"North Station"=>2}
              line_to_take = origin_to_connection_lines.map { |line| line.include?(ok) ? line[-1] : nil }.compact
              dk == ok ? dir_origin_to_connection << "Take #{origin} to #{ok} on the #{line_to_take.length > 1 ? stringify_line_array(line_to_take).join(", ") : stringify_line_array(line_to_take).join("")} for #{ov} stop(s)\n" : false
            }
        }
        # TODO: Set the return values of these block to an array or key, then read the steps back in order.
        shortest_connect_to_dest_stops.each_pair { |dk,dv|
          shortest_origin_to_connect_stops.each_pair { |ok,ov|
            line_to_take = connection_to_destination_line.map { |line| line.include?(ok) ? line[-1] : nil }.compact
            ok == dk ? dir_connection_to_destination << "Take #{dk} to #{destination} on the #{line_to_take.length > 1 ? stringify_line_array(line_to_take).join(", ") : stringify_line_array(line_to_take).join("")} for #{dv} stop(s)\n" : false
          }
        }
        result = dir_origin_to_connection + dir_connection_to_destination
        directions(result)
      elsif common_unique_connections.length == 0 && uncommon_unique_connections.length != 0
        result = "You're fucked, call Über."
        directions(result)
      end
    end
  end

  # helper function
  def distance_between(stop1, stop2, array)
    (array.index(stop1) - array.index(stop2)).abs
  end

  # helper function, returns an array for output by stripping out all the "_" and spacing "...line A/B/C/D/E" on the lines' names in output
  def stringify_line_array(array)
    new_array = array.map { |item| item.to_s =~ /[A-Z]{1}\b/ ? item.to_s.insert(item.to_s =~ /[A-Z]{1}\b/, " ").capitalize : item.to_s.capitalize }
    new_array.map! { |item| item.split.map(&:capitalize)*' ' }
  end

  # converts a station's name from proper noun (ie "Park Street") to a symbol for @@routes[:connections] (ie :park_street)
  def convert_to_connection_symbol(string)
    string.gsub(/[ ]{1}/, "_").downcase.to_sym
  end

  # does the opposite of above
  def convert_to_connection_string(key)
    # string = key.to_s =~ /[A-Z]{1}\b/ ? key.to_s.insert(key.to_s =~ /[A-Z]{1}\b/, " ").capitalize : key.to_s.capitalize
    key.to_s =~ /[_]/ ? key.to_s.gsub!(/[_]/, " ").split.map(&:capitalize)*' ' : key.to_s.capitalize
    #=> this has undesired effects on renaming conventions, messing up the logic
    # ————————————————————
    # key.to_s =~ /[A-Z]{1}\b/ ? key.to_s.insert(key =~ /[A-Z]{1}\b/, " ").split.map(&:capitalize)*' ' : key.to_s.capitalize
    # ————————————————————

    # TODO: convert the "Greenlinee" to "Greenline E", "Greenlineb" to "Greenline B" and so on
  end

  def eval_common_elements(array1, array2)
    array1 & array2
  end

  def get_route_line(station)
    lines = {}
    @@routes.each_pair { |key,value| value.include?(station) ? lines.store(key, value) : false }
    return lines
  end

  def directions(result)
    puts result
  end

end

puts "\n\n\nTeeRouter find your connections on the MBTA.\nTry it: departure station, arrival station\n"
TeeRouter.new(gets.chomp)


# Working the logic out
# ————————————————————————————————
# if my origin and destination share the same line, result is a direct connection
  # show all the direct connections (may be more than 1)
# if my origin and destination don't share the same line, we have to make a connection
  # if they share common_unique_connections you can transfer once, origin > connection > destination
    # show all the difference possibilities
    # give the shortest route
  # if they share multiple common_unique_connections, theres' more than one way to get to where you're going.
    # origin > connection1 > destination
    # origin > connection2 > destination
    # origin > connection3 > destination
    # so on....
    # out of these, I need to calculate the shortest distance in stops, and give that back.
  # if they don't share common_unique_connections
    # they share uncommon_unique_connections, meaning stations that connect to our origin/destination exist, and stations connect to each other somehow


# Part of working things out with the logic
# ———————————————————————————————————

# for state I would expect these results:
# common_unique_connections = ["Downtown Crossing", "Haymarket", "North Station", "Government Center"]
# origin_lines = { :redlineA => [...], :redlineB=>[...], :greenlineB=>[...], :greenlineC=>[...],:greenlineD=>[...],:greenlineE=>[...]}
# destination_lines = { :orangeline=>[...], :blueline=>[...] }
# common_unique_connections[0] => true, true, false, false, false, false
# common_unique_connections[1] => false, false, false, true, false, true
# common_unique_connections[2] => false, false, false, true, false, true
# common_unique_connections[3] => false, false, false, true, false, true
