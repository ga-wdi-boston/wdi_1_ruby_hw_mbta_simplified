#need ordered methods of keeping data; arrays

red_line = ["Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"]
green_line = ["Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"]
orange_line = ["North Station", "Haymarket", "Park Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"]
all_stops = []#current plan basically involves storing a string and later using the split method to get the different parts out of the string

def ask_for_origin_start#need to get an array name and a position in the array
	puts "Where do you originally start in the train system? red/green/orange [insert station name here]"# I need the user to input something like red Park Street; maybe use method to change to lowercase before checking with ifs where they are?
	gets.chomp
end