class MBTA

  def stops
    {
      red: [
        'Alewife',
        'Davis',
        'Porter',
        'Harvard',
        'Central',
        'Kendall/MIT',
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

  def distance(stop1, stop2)

    # The way I see it, since all lines intersect at Park Street,
    # and no other stops are shared,
    # the distance between any two stops
    # is the sum of their distances to Park Street.

    origin_line = stop1[0]
    origin_stop = stop1[1]
    destination_line = stop2[0]
    destination_stop = stop2[1]

    # the distance between a and b is (position b - position a)

    position_a = self.stops[origin_line].index(origin_stop)
    position_b = self.stops[destination_line].index(destination_stop)

    if origin_line == destination_line
      return (position_b - position_a).abs
    else
      # recursion ahoy!
      distance_a = distance([origin_line, origin_stop], [origin_line, self.common_stop])
      distance_b = distance([destination_line, destination_stop], [destination_line, self.common_stop])
      return distance_a + distance_b
    end

  end

end