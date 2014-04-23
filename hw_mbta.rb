# create an array for each line
green = ['Copley', 'Arlington', 'Boylston', 'Park Street', 'Government Center', 'Haymarket']

red = ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall', 'Park Street', 'South Station']

orange = ['Tufts', 'Chinatown', 'Downtown Crossing', 'State Street', 'Park Street', 'Haymarket', 'North Station']

# create a hash for each subway line, containing a name that corresponds to the name of the line
# and stops that are assigned the aforementioned arrays.
green_line = { :name => 'green',
               :stops => green }

red_line = { :name => 'red',
             :stops => red }

orange_line = { :name => 'orange',
                :stops => orange }

intersection_all = green & red & orange

subway_system = [green_line, red_line, orange_line]

puts 'What is your originating subway stop?'
origin = gets.chomp

origin_lines = []

subway_system.each do |line|
  if line[:stops].include?(origin)
    origin_lines << line[:name]
  end
end

# puts 'What is your destination subway stop?'
# dest = gets.chomp




# single = green.index('Copley') - green.index('Park Street')
# puts "#{single.abs} stops to get from #{origin} to #{destination}"
