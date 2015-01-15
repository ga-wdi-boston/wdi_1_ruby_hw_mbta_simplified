#Stuff happens
class Mbta
  attr_reader :orig_line, :orig_stop, :dest_line, :dest_stop, :lines

  def initialize (orig_line, orig_stop, dest_line, dest_stop)
    @orig_line = orig_line
    @orig_stop = orig_stop
    @dest_line = dest_line
    @dest_stop = dest_stop
    @lines = {
      Red: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"],
      Green: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
      Orange: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "China Town", "Tufts Medical Center"]
    }
  end

  def diff_line_count (lineStart, start, lineStop, stop)
    if start == stop
      0
    else
      count1 = same_line_count(lineStart, start, "Park Street")
      count2 = same_line_count(lineStop, stop, "Park Street")

      count1 + count2
    end
  end

  def same_line_count (lineName, stop1, stop2)
    count = lines[lineName.to_sym].index(stop1) - lines[lineName.to_sym].index(stop2)
    if count < 0
    count *= -1
    else
    count
    end
  end

  def same_line (start, final)
    if start == final
      true
    else
      false
    end
  end

  def count_stops
  #origin line, origin stop, destination line, destination stop
    if same_line(orig_line, dest_line) == true
      same_line_count(orig_line, orig_stop, dest_stop)
    else
      diff_line_count(orig_line, orig_stop, dest_line, dest_stop)
    end
  end
end

puts "1 " << "#{Mbta.new("Red", "Alewife", "Red", "South Station").count_stops == 7}"
puts "2 " << "#{Mbta.new("Green", "Boylston", "Green", "Haymarket").count_stops == 3}"
puts "3 " << "#{Mbta.new("Orange", "Haymarket", "Orange", "Downtown Crossing").count_stops ==3}"

puts "4 " << "#{Mbta.new("Red", "Kendall/MIT", "Orange", "State Street").count_stops == 2}"
puts "5 " << "#{Mbta.new("Red", "Porter", "Green", "Copley").count_stops == 7}"
puts "6 " << "#{Mbta.new("Orange", "Park Street", "Green", "Park Street").count_stops == 0}"
puts "7 " << "#{Mbta.new("Red", "South Station", "Orange", "North Station").count_stops == 3}"
puts "8 " << "#{Mbta.new("Orange", "Haymarket", "Green", "Haymarket").count_stops == 0}"
puts "9 " << "#{Mbta.new("Red", "Central", "Green", "Arlington").count_stops == 4}"
puts "10 " << "#{Mbta.new("Red", "Alewife", "Orange", "Tufts Medical Center").count_stops == 10}"
