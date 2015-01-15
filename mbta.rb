mbtamap = {
  "Red Line" =>[
    "Alewife",
    "Davis",
    "Porter",
    "Harvard",
    "Central",
    "Kendall/MIT",
    "Park Street",
    "South Station"
  ],
  "Green Line" => [
    "Haymarket",
    "Government Center",
    "Park Street",
    "Boylston",
    "Arlington",
    "Copley"
  ],
  "Orange Line" => [
    "North Station",
    "Haymarket",
    "Park Street",
    "State Street",
    "Downtown Crossing",
    "Chinatown",
    "Tufts Medical Center"
  ]
}
lines = mbtamap.keys

def prompt_menu(title, options)
  puts title
  options.each_with_index do |option, index|
    puts "#{index + 1} - #{option}" 
  end
  while true
    user_input = gets.chomp.to_i
    if user_input > 0 && user_input <= options.count
      return user_input - 1
    end
    puts "Not a valid option, try again"
  end
end
puts prompt_menu "Pick a line", lines



