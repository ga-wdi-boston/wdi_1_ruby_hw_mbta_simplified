#Stuff happens
class Mbta
 # attr_reader :orig_line, :orig_stop, :dest_line, :dest_stop, :lines
   attr_reader :lines

  def initialize ()
   # @orig_line = orig_line
   # @orig_stop = orig_stop
   # @dest_line = dest_line
   # @dest_stop = dest_stop
    @lines = {
      Red: ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"],
      Green: ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"],
      Orange: ["North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "China Town", "Tufts Medical Center"]
    }
  end

  def diffLineCount (line_start, start, line_stop, stop)
    if start == stop
      0
    else
      count1 = sameLineCount(line_start, start, "Park Street")
      count2 = sameLineCount(line_stop, stop, "Park Street")

      count1 + count2
    end
  end

  def sameLineCount (line_name, stop1, stop2)
    count = lines[line_name.to_sym].index(stop1) - lines[line_name.to_sym].index(stop2)
    if count < 0
    count *= -1
    else
    count
    end
  end

  def sameLine (start, final)
    if start == final
      true
    else
      false
    end
  end

  def countStops(orig_line, orig_stop, dest_line, dest_stop)
    if sameLine(orig_line, dest_line) == true
      sameLineCount(orig_line, orig_stop, dest_stop)
    else
      diffLineCount(orig_line, orig_stop, dest_line, dest_stop)
    end
  end

  def addStop(lin, new_stop, before_stop) #Returns modified array route
    ind = lines[lin.to_sym].index(before_stop)
    lines[lin.to_sym].insert(ind, new_stop)
    lines[lin.to_sym]
  end

   def delStop(lin, rem_stop) #Returns modified array route
    lines[lin.to_sym].delete(rem_stop)
    lines[lin.to_sym]
  end

  def addLine(n_line, lin_arr) #Returns modified array route
    if lin_arr.include?("Park Street")
      lines[n_line.to_sym] = lin_arr
      lines[n_line.to_sym]
    else
      "Error, must include Park Street"
    end
  end

  def deleteLine(d_line) #Returns nothing
      lines.delete(d_line.to_sym)
    end

  def diffLineSwap (li1, stop1, li2, stop2) #Returns lines
    if stop1 == "Park Street" || stop2 == "Park Street"
      "Error, can not swap Park Street"
    else
      ind1 = lines[li1.to_sym].index(stop1)
      ind2 = lines[li2.to_sym].index(stop2)
      lines[li1.to_sym][ind1] = stop2
      lines[li2.to_sym][ind2] = stop1
      lines
    end
  end

  def sameLineSwap (li, st1, st2) #Returns swapped stops

    ind1 = lines[li.to_sym].index(st1)
    ind2 = lines[li.to_sym].index(st2)
    lines[li.to_sym][ind1] = st2
    lines[li.to_sym][ind2] = st1
    lines[li.to_sym]
  end

  def swapStops(orig_line, orig_stop, dest_line, dest_stop) #Returns nothing
    if sameLine(orig_line, dest_line) == true
      sameLineSwap(orig_line, orig_stop, dest_stop)
    else
      diffLineSwap(orig_line, orig_stop, dest_line, dest_stop)
    end
  end

  def print_entire_map
    lines
  end

end

#Tests for the above class.

#Tests stop counters.
puts "1 " << "#{Mbta.new().countStops("Red", "Alewife", "Red", "South Station") == 7}"
puts "2 " << "#{Mbta.new().countStops("Green", "Boylston", "Green", "Haymarket") == 3}"
puts "3 " << "#{Mbta.new().countStops("Orange", "Haymarket", "Orange", "Downtown Crossing") ==3}"
puts "4 " << "#{Mbta.new().countStops("Red", "Kendall/MIT", "Orange", "State Street") == 2}"
puts "5 " << "#{Mbta.new().countStops("Red", "Porter", "Green", "Copley") == 7}"
puts "6 " << "#{Mbta.new().countStops("Orange", "Park Street", "Green", "Park Street") == 0}"
puts "7 " << "#{Mbta.new().countStops("Red", "South Station", "Orange", "North Station") == 3}"
puts "8 " << "#{Mbta.new().countStops("Orange", "Haymarket", "Green", "Haymarket") == 0}"
puts "9 " << "#{Mbta.new().countStops("Red", "Central", "Green", "Arlington") == 4}"
puts "10 " << "#{Mbta.new().countStops("Red", "Alewife", "Orange", "Tufts Medical Center") == 10}"

#Testing adding and deleting methods
newMap = Mbta.new()
puts "11 " << (newMap.addStop("Red", "Michael", "Davis") == ["Alewife", "Michael", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"]).to_s

puts "12 " << (newMap.delStop("Red", "Michael") == ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"]).to_s

puts "13 " << (newMap.addLine("Grey", ["Michael","Teele","Park Street","Gardner Street"]) == ["Michael","Teele","Park Street","Gardner Street"]).to_s

newMap.deleteLine("Orange")

#Test swapping methods
puts "14 " << (newMap.swapStops("Red", "Alewife", "Red", "Central") == ["Central", "Davis", "Porter", "Harvard", "Alewife", "Kendall/MIT", "Park Street", "South Station"]).to_s

puts "14 " << (newMap.swapStops("Red", "Alewife", "Red", "Central") == ["Central", "Davis", "Porter", "Harvard", "Alewife", "Kendall/MIT", "Park Street", "South Station"]).to_s

puts "15 " << "#{newMap.swapStops("Red", "Davis", "Green", "Arlington")}"

#puts newMap.print_entire_map
