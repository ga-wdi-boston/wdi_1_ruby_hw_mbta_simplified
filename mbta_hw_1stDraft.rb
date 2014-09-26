require 'pry' #initialize pry
# First I will work on the prompt

lines = {

    intersecting_station: ["Park Street"],

    red_line: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT", "Park Street", "South Station"],

    green_line: ["Haymarket","Government Center","Park Street","Boylston","Arlington", "Copley"],

    orange_line: ["North Station","Haymarket","Park","State Street","Downtown Crossing","Chinatown","Tufts Medical Center"]

    }

#prompt
#origin line

def original_line
puts "What line are you starting from?"
gets.chomp.to_s.split.map(&:capitalize).join(' ')
end
original_line
binding .pry
def original_station
puts "What station are you starting from?"
  origin_station = gets.chomp.to_s.split.map(&:capitalize).join(' ')
  return origin_station
end

def destined_station
puts "What stations would you like to get to?"
  destination_station = gets.chomp.to_s.split.map(&:capitalize).join(' ')
end

def destined_line
puts "What line is that on?"
  destination_line = gets.chomp.to_s.split.map(&:capitalize).join(' ')
end
# prompt
origin_line = original_line
origin_station = original_station
destination_station = destined_station
destination_line = destined_line

#Hash for lines



red_line_arr = lines[:red_line] #the hash address of the red_line array
green_line_arr = lines[:green_line]
orange_line_arr = lines[:orange_line]

#red_line_arr.index("Alewife") == 0
#def index_origin_line
  if origin_line == "Red Line"
    origin_address = red_line_arr.index(origin_station) #index of origin station/ w/specific line

  # elsif origin_line == "Green Line"
  #   origin_address = green_line_arr.index(origin_station)

  # else origin_line == "Orange Line"
  #   origin_address = orange_line_arr.index(origin_station)
  end
#end

#def index_destination_line
  if destination_line == "Red Line"
   destination_address = red_line_arr.index(destination_station) #index of origin station/ w/specific line

  elsif destination_line == "Green Line"
   destination_address = green_line_arr.index(destination_station)

  else destination_line == "Orange Line"
    destination_address = orange_line_arr.index(destination_station)
  end
#end

# index_origin_line
# index_destination_line
def same_line?(origin_line,destination_line)
  if origin_line == destination_line
   true
  else
   false
  end
end
 same_line = same_line?(origin_line,destination_line)
#binding.pry

#distance_to_park1 =
# if lines[:origin_line][lines[:origin_line].index("Park Street").to_i] < index(origin_station).to_i
#   distance_to_park1 = lines[:origin_line][index(origin_station)].to_i - lines[:origin_line][index("Park Street")].to_i
# elsif lines[:origin_line][index("Park Street")] > index(origin_station)
#   distance_to_park1 =  lines[:origin_line][index("Park Street")].to_i -lines[:origin_line][index(origin_station)].to_i
# end


if origin_address.to_i < destination_address.to_i && same_line == true
  number_of_stops = destination_address.to_i - origin_address.to_i
elsif origin_address.to_i > destination_address.to_i && same_line == true
  number_of_stops = origin_line.to_i - destination_address.to_i
  number_of_stops = number_of_stops.abs
else origin_address.to_i == destination_address.to_i && same_line == true
  puts "You're already there."
end
puts "This trip will take #{number_of_stops} stops."
# prompt for user input





binding.pry #call pry
