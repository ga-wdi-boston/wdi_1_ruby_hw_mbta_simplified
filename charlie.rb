mbta = {
        red: ["Alewife",
           "Davis",
           "Porter",
           "Harvard",
           "Central",
           "Kendall/MIT",
           "Park Street",
           "South Station"],

        green: [
           "Haymarket",
           "Government Center",
           "Park Street",
           "Boylston",
           "Arlington",
           "Copley"],

        orange: [
           "North Station",
           "Haymarket",
           "Park Street",
           "State Street",
           "Downtown Crossing",
           "Chinatown",
           "Tufts Medical Center"]
        }


# User selects origin
puts "Welcome to the MBTA!"

while true

  print "What is your departing station? "
  origin = gets.chomp

  # Calculate user input for origin location

  # Haymarket validation
  if origin == "Haymarket"
    print "Are you on the green line or orange line? "
    haymarket_origin = gets.chomp.downcase

    if haymarket_origin.include?("green")
      origin_line = :green
      origin_num = mbta[:green].index(origin)
      to_park = mbta[:green].index("Park Street")
      origin_distance = (to_park - origin_num).abs  # distance current to park
      break

    elsif haymarket_origin.include?("orange")
      origin_line = :orange
      origin_num = mbta[:orange].index(origin)
      to_park = mbta[:orange].index("Park Street")
      origin_distance = (to_park - origin_num).abs   # distance current to park
      break
    end

  end


  # All other locations
  if mbta[:red].include?(origin)
    origin_line = :red
    origin_num = mbta[:red].index(origin)
    to_park = mbta[:red].index("Park Street")
    origin_distance = (to_park - origin_num).abs   # distance current to park
    break

  elsif mbta[:green].include?(origin) && origin != "Haymarket"
    origin_line = :green
    origin_num = mbta[:green].index(origin)
    to_park = mbta[:green].index("Park Street")
    origin_distance = (to_park - origin_num).abs  # distance current to park
    break

  elsif mbta[:orange].include?(origin) && origin != "Haymarket"
    origin_line = :orange
    origin_num = mbta[:orange].index(origin)
    to_park = mbta[:orange].index("Park Street")
    origin_distance = (to_park - origin_num).abs   # distance current to park
    break
  else
    puts "Sorry, that station does not exist."
    puts "Please use one of the following stations: "
    puts "RED LINE\n #{mbta[:red]}"
    puts "GREEN LINE\n #{mbta[:green]}"
    puts "ORANGE LINE\n #{mbta[:orange]}"
  end

end  # end of while for origin

# Calculate user input for destination location

while true

  print "Destination: "
  destination = gets.chomp

  # Haymarket validation
  if destination == "Haymarket"
    print "Are you on the green line or orange line? "
    haymarket_destination = gets.chomp.downcase

    if haymarket_destination.include?("green")
      destination_line = :green
      destination_num = mbta[:green].index(destination)
      to_park = mbta[:green].index("Park Street")
      destination_distance = (to_park - destination_num).abs  # dist park to dest
      break
    elsif haymarket_destination.include?("orange")
      destination_line = :orange
      destination_num = mbta[:orange].index(destination)
      to_park = mbta[:orange].index("Park Street")
      destination_distance = (to_park - destination_num).abs   # dist park to dest
      break
    end

  end


  #All other destinations
  if mbta[:red].include?(destination)
    destination_line = :red
    destination_num = mbta[:red].index(destination)
    from_park = mbta[:red].index("Park Street")
    destination_distance = (from_park - destination_num).abs  # dist park to dest
    break

  elsif mbta[:green].include?(destination) && origin != "Haymarket"
    destination_line = :green
    destination_num = mbta[:green].index(destination)
    from_park = mbta[:green].index("Park Street")
    destination_distance = (from_park - destination_num).abs   # dist park to dest
    break

  elsif mbta[:orange].include?(destination) && origin != "Haymarket"
    destination_line = :orange
    destination_num = mbta[:orange].index(destination)
    from_park = mbta[:orange].index("Park Street")
    destination_distance = (from_park - destination_num).abs   # dist park to dest
    break
  else
      puts "Sorry, that station does not exist."
      puts "Please use one of the following stations: "
      puts "RED LINE\n #{mbta[:red]}"
      puts "GREEN LINE\n #{mbta[:green]}"
      puts "ORANGE LINE\n #{mbta[:orange]}"
  end

end #end of while for destination

# Determine if on same line or switching lines

if origin_line == destination_line
  stops = (origin_num - destination_num).abs

  if stops == 0
    puts "You have arrived at your destination!"
  elsif stops == 1
    puts "You have #{stops} stop until you arrive at your destination!"
  else
    puts "You have #{stops} stops until you arrive at your destination!"
  end

else

# If switching lines
stops = origin_distance + destination_distance

  if stops == 0
    puts "You have arrived at your destination!"
  elsif stops == 1
    puts "You have #{stops} stop until you arrive at your destination!"
  else
    puts "You have #{stops} stops until you arrive at your destination!"
  end

end



