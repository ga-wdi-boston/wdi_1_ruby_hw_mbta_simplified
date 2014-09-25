require 'pry'

class TeeRouter

  @@routes = {
    redline: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT","Park Street","South Station"],
    greenline: ["Haymarket","Government Center","Park Street","Boylston","Arlington","Copley"],
    orangeline: ["North Station","Haymarket","Park Street","State Street","Downtown Crossing","China Town","Tufts Medical Center"]
  }

  def initialize(string)
    info = string.scan(/[\w]+/im) # => ["...", "...", "...", "..."]
    parse_array(info)
  end

  def parse_array(array)
    good = array.length == 4 ? parse_trip(array) : "Invalid arrival and destination."
  end

  def parse_trip(array)
    origins = array.map.with_index{ |orig,i| i <= 1 ? orig : nil }.compact
    destinations = array.map.with_index{ |dest,i| i > 1 ? dest : nil }.compact
    binding.pry #breakpoint
  end

end

puts "Enter: departure line, departure station, arrival line, arrival station (comma separated values)"
TeeRouter.new(gets.chomp)

# Redline, Harvard, OrangeLine, Chinatown

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
