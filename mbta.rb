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

end