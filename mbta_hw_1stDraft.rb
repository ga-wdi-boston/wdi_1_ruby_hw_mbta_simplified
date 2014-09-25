require 'pry' #initialize pry
# First I will work on the prompt

#prompt
#origin line
puts "What line are you starting from?"
 origin_line = gets.chomp.to_s.split.map(&:capitalize).join(' ')

puts "What station are you starting from?"
origin_station = gets.chomp.to_s.split.map(&:capitalize).join(' ')

puts "What stations would you like to get to?"
destination_station = gets.chomp.to_s.split.map(&:capitalize).join(' ')

puts "What line is that on?"
destination_line = gets.chomp.to_s.split.map(&:capitalize).join(' ')



#Hash for lines

lines = {

    red_line: ["Alewife","Davis","Porter","Harvard","Central
      ","Kendall/MIT", "Park Street", "South Station"],

    green_line: ["Haymarket","Government Center","Park Street","Boylston","Arlington", "Copley"],

    orange_line: ["North Station","Haymarket","Park","State Street","Downtown Crossing","Chinatown","Tufts Medical Center"]

    }

red_line_arr = lines[:red_line] #the hash address of the red_line array
green_line_arr = lines[:green_line]
orange_line_arr = lines[:orange_line]

#red_line_arr.index("Alewife") == 0

if origin_line == "Red Line"
  red_line_arr.index(origin_station) #index of origin station/ w/specific line

elsif origin_line == "Green Line"
  green_line_arr.index(origin_station)

else origin_line == "Orange Line"
  orange_line_arr.index(origin_station)
end


if destination_line == "Red Line"
  red_line_arr.index(destination_station) #index of origin station/ w/specific line

elsif destination_line == "Green Line"
  green_line_arr.index(destination_station)

else destination_line == "Orange Line"
  orange_line_arr.index(destination_station)
end



binding.pry #call pry
