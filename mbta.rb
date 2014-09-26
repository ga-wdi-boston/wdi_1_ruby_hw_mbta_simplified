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

  def trip(origin_line, origin_stop, destination_line, destination_stop)
    {
      origin: {
        line: origin_line,
        stop: origin_stop
      },
      destination: {
        line: destination_line,
        stop: destination_stop
      }
    }
  end

  def position(line, stop)
    self.stops[line].index(stop)
  end

  def distance(trip)
    origin_line = trip[:origin][:line]
    origin_stop = trip[:origin][:stop]
    destination_line = trip[:destination][:line]
    destination_stop = trip[:destination][:stop]

    position_a = self.position(origin_line, origin_stop)
    position_b = self.position(destination_line, destination_stop)

    if origin_line == destination_line
      return (position_b - position_a).abs
    else
      origin_trip = self.trip(origin_line, origin_stop, origin_line, self.common_stop)
      destination_trip = self.trip(destination_line, self.common_stop, destination_line, destination_stop)

      distance_a = distance(origin_trip)
      distance_b = distance(destination_trip)
      return distance_a + distance_b
    end

  end

end