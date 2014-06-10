reds = %w(Alewife Davis Porter Harvard Central Kendall/MIT ParkStreet SouthStation)
greens = %w(Haymarket GovernmentCenter ParkStreet Boylston Arlington Copley)
oranges = %w(NorthStation Haymarket ParkStreet StateSt Downtown Chinatown TuftsMedical)


puts "ORIGIN INFORMATION"

origin_line = nil

while origin_line == nil do
  puts "Line:"
  input = gets.chomp.downcase
  if input == "red"
    origin_line = reds
  elsif input == "green"
    origin_line = greens
  elsif origin_line == "orange"
    origin_line = oranges
  else
    puts "Enter red, green, or orange line"
  end
end

origin_station = nil

