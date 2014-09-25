class MBTA

  def stops
    # The way I see it, since all lines intersect at Park Street,
    # and no other stops are shared,
    # the distance between any two stops
    # is the sum of their distances to Park Street.
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

  def distance(stop1, stop2)
    origin_line = stop1[0]
    origin_stop = stop1[1]
    destination_line = stop2[0]
    destination_stop = stop2[1]

    # the distance between a and b is (position b - position a)

    if origin_line == destination_line
      position_a = self.stops[origin_line].index(origin_stop)
      position_b = self.stops[destination_line].index(destination_stop)

      return (position_b - position_a).abs
    end

  end

end