#need ordered methods of keeping data; arrays

red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"]
green_line = ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]
orange_line = ["North Station", "Haymarket", "Park Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
all_stops = []#saving station names here
both_lines = []#saving the lines that are used
def ask_for_origin_line
	puts "What line are you using originally?"
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
	puts "What line are you going to connect to?"
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

def calculate_distance(first_station_position, second_station_position)#technically this will just be counting stops; needs index positions from a single array
	
end