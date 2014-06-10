# Initial data structure for subway system

subway = {
  green_line: ['Haymarket', 'Government Center', 'Park Street', 'Boylston', 'Arlington', 'Copley'],
  red_line: ['Alewife', 'Davis', 'Porter', 'Harvard', 'Central', 'Kendall/MIT', 'Park Street', 'South Station'],
  orange_line: ['North Station', 'Haymarket', 'Park Street', 'State Street', 'Downtown Crossing', 'Chinatown', 'Tufts Medical Center']
}

# Calculation for distance between stops

puts distance = (subway[:green_line].index("Park Street") - subway[:green_line].index("Haymarket")).abs
