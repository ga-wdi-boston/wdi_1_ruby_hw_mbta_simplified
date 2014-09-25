#need ordered methods of keeping data; arrays


all_stops = []#saving station names here
both_lines = []#saving the lines that are used
#They are all going to have Park Street in a stop on both lines. The end for the original and the start for the final.
def ask_for_origin_line
	puts "What train line are you using originally?"
	gets.chomp
end
def ask_for_origin_start
	puts "What station do you start at in the train system?"
	gets.chomp
end

def ask_for_origin_end
	puts "What stop are getting off at to take a connecting train to your final destination?"
	gets.chomp
end

def ask_for_final_line
	puts "What train line are you going to connect to?"
	gets.chomp
end

def ask_for_final_start
	puts "What station do you start at on the second line?"
	gets.chomp
end

def ask_for_final_end
	puts "What station do you stop at completely?"
	gets.chomp
end

def calculate_distance(first_station_position, second_station_position)#technically this will just be counting stops; needs index positions from a single array; they should both be integers
	(first_station_position - second_station_position).abs
end

def total_distance(first_distance, second_distance)
	puts "You'll have to travel"
	first_distance + second_distance
end

def find_the_stop_index(the_line, stop_name)

	red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"]
	green_line = ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]
	orange_line = ["North Station", "Haymarket", "Park Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]

	if the_line == "red"
		return red_line.index(stop_name)
	elsif the_line == "green"
		return green_line.index(stop_name)
	elsif the_line == "orange"
		return orange_line.index(stop_name)
	else
		puts "Error there appears to be a mistake in your line choice."
		exit			
	end
end

both_lines[0] = ask_for_origin_line
all_stops[0] = ask_for_origin_start
all_stops[1] = ask_for_origin_end
origin_index_save = []

origin_index_save[0] = find_the_stop_index(both_lines[0], all_stops[0])
origin_index_save[1] = find_the_stop_index(both_lines[0], all_stops[1])
origin_distance = calculate_distance(origin_index_save[0], origin_index_save[1])

both_lines[1] = ask_for_final_line
all_stops[2] = ask_for_final_start
all_stops[3] = ask_for_final_end
final_index_save = []

final_index_save[0] = find_the_stop_index(both_lines[1], all_stops[2])
final_index_save[1] = find_the_stop_index(both_lines[1], all_stops[3])
final_distance = calculate_distance(final_index_save[0], final_index_save[1])

puts total_distance(origin_distance, final_distance).to_s + " stops"

#puts origin_index_save; used to check origin_index_save