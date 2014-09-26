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

  def origin_to_trip(origin)
    self.trip([
      origin[:line],
      origin[:stop],
      origin[:line],
      self.common_stop
      ])
  end

  def destination_to_trip(destination)
    self.trip([
      destination[:line],
      self.common_stop,
      destination[:line],
      destination[:stop]
      ])
  end

  def distance(trip)

    # why is this so fucking huge?

    position_a, position_b = self.trip_positions(trip)

    if trip[:origin][:line] == trip[:destination][:line]
      return (position_b - position_a).abs
    else
      origin_trip = origin_to_trip(trip[:origin])
      destination_trip = destination_to_trip(trip[:destination])

      distance_a, distance_b = [
        origin_trip,
        destination_trip
        ].map do |trip|
        distance(trip)
      end

      return distance_a + distance_b
    end

  end

end