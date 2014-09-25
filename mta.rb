# greeting and informing the user about the subway.
puts "Welcome to the Station"
puts ">>> Red Line: Alewife, Davis, Porter, Harvard, Central, Kendall/MIT ,Park Street, South Station"
puts ">>> Green Line: Haymarket, Government Center, Park Street ,Boylston, Arlington ,Copley"
puts ">>> Orange Line: North Station, Haymarket, Park Street, State Street, Downtown Crossing ,Chinatown ,Tufts Medical Center"
puts "Subway will stop on each station!!"

# prompts the user to input starting and ending station, also starting and ending line of the route.
puts "Choose your origin line: "
origin_line = gets.chomp.downcase.to_sym
puts "Choose your origin stop: "

# changes the input to correct format in order to get the values of keys in the has properly.
origin_stop = gets.chomp.downcase
if origin_stop.include? " "
	origin_stop.gsub!(/ /, '_')
end
origin = origin_stop.to_sym

puts "Choose your destination line: "
dest_line = gets.chomp.downcase.to_sym

# changes the input to correct format in order to get the values of keys in the has properly.
puts "Choose your destination stop: "
dest_stop = gets.chomp.downcase
if dest_stop.include? " "
	dest_stop.gsub!(/ /, '_')
end
dest = dest_stop.to_sym


# definition of subway hash.

subway = {
	lines: {
		red: {
			alewife: -6,
			davis: -5,
			porter: -4,
			harvard: -3,
			central: -2,
			kendall: -1,
			park_street: 0,
			south_station: 1
		},

		green: {
			haymarket: -2,
			government_center: -1,
			park_street: 0,
			boylston: 1,
			arlington: 2,
			copley: 3
		},

		orange: {
			north_station: -2,
			haymarket: -1,
			park_street: 0,
			state_street: 1,
			downtown_crossing: 2,
			chinatown: 3,
			tufts_medical_center: 4
		}
	}
}

# calculates the number of stops between the stations chosen by users
num_stop = ((subway[:lines][dest_line][dest]) - (subway[:lines][origin_line][origin])).abs

# converting the specific symbols to strings in order to display the result properly and user-friendly.
origin_s = origin.to_s
if origin_s.include? "_"
	origin_s.gsub!(/_/, ' ')
end

dest_s = dest.to_s
if dest_s.include? "_"
	dest_s.gsub!(/_/, ' ')
end

# informs the user about the route and number of stops to the destination.
puts "Your route is #{origin_s} on #{origin_line} line -->>  #{dest_s} on #{dest_line} line."
puts "You will arrive in #{num_stop} stops."

# Cenk Yurtbilir




