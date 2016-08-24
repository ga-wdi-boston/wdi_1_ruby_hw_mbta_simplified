require "byebug"
#binding.byebug

# Ask our user where they are

# puts " What station are you on?"
# origin_station = gets().chomp()

# puts "What line are you on?"
# origin_line = gets().chomp()

# # Ask our user where they are going

# puts "What station are you going"
# destination_station = gets().chomp()

# puts "What line is that station in?"
# destination_line = gets().chomp()

# Create Arrays for each Line

red_line =['alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station']

green_line = ['Haymarket', 'Goverment Center', 'Park Street', 'Boyston', 'Arlington', 'Coplay']

orange_line = ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']

# To find the distance bertween stations: Substract the distance between the origin_station [index]
# and the destination_station [index]

# TEST origin_station[index] - destination_station[index]

ed_difference = red_line.index('alewife') - red_line.index('South Station')

puts red_difference.abs

green_difference = green_line.index('Haymarket') - green_line.index('Coplay')

puts green_difference.abs

orange_difference = orange_line.index('Tufts Medical Center') - orange_line.index('State Street')

puts orange_difference.abs

# This method checks to see if the input from the user stays in the same station
def same_line (origin_station, orange_line)


 end









