class MBTA

  def stops
    {
      red: [
        'Alewife',
        'Davis',
        'Porter',
        'Harvard',
        'Central',
        'Kendall',
        'Park Street',
        'South Station'
      ],
      green: [
        'Haymarket',
        'Government Center',
        'Park Street',
        'Boylston',
        'Arlington',
        'Copley'
      ],
      orange: [
        'North Station',
        'Haymarket',
        'Park Street',
        'State Street',
        'Downtown Crossing',
        'Chinatown',
        'Tufts Medical Center'
      ]
    }
  end

  def common_stop
    'Park Street'
  end

  # def trip(origin_line, origin_stop, destination_line, destination_stop)
  def trip(selections)
    # takes an array
    # this assumes the selections are in a certain order which,
    # uhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh
    {
      origin: {
        line: selections[0],
        stop: selections[1]
      },
      destination: {
        line: selections[2],
        stop: selections[3]
      }
    }
  end

  def position(line, stop)
    self.stops[line].index(stop)
  end

  def trip_positions(trip)
    positions = [trip[:origin], trip[:destination]].map do |point|
      self.position(point[:line], point[:stop])
    end
    positions
  end

  def distance(trip)

    # why is this so fucking huge?

    # first, you get the origin line, the origin stop,
    # the destination line, and the destination stop

    selections = [trip[:origin], trip[:destination]].map do |location|
      location.values
    end

    selections.flatten!

    origin_line, origin_stop, destination_line, destination_stop = selections

    # i'd like something like this:

    position_a, position_b = self.trip_positions(trip)

    # v--- this is the only code that actually concerns distance
    if origin_line == destination_line
      return (position_b - position_a).abs
    else
      origin_trip = self.trip([origin_line,
        origin_stop,
        origin_line,
        self.common_stop])
      # origin_trip = self.trip(selections)
      destination_trip = self.trip([destination_line,
        self.common_stop,
        destination_line,
        destination_stop])
      # origin_trip = self.trip(selections)


      distance_a = distance(origin_trip)
      distance_b = distance(destination_trip)
      return distance_a + distance_b
    end
    # ^---

  end

end