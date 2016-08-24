class Trip
  MBTA = {
    "Red" => [
      "Alewife", "Davis", "Porter", "Harvard", "Central", "Kendall/MIT", "Park Street", "South Station"
    ],
    "Green" => [
      "Haymarket", "Government Center", "Park Street", "Boylston", "Arlington", "Copley"
    ],
    "Orange" => [
      "North Station", "Haymarket", "Park Street", "State Street", "Downtown Crossing", "Chinatown", "Tufts Medical Center"
    ]
  }

  def initialize(oriLine:, oriStop:, destLine:, destStop:)
    @oriLine = oriLine
    @oriStop = oriStop
    @destLine = destLine
    @destStop = destStop
  end

  def oriLine
    @oriLine
  end

  def oriStop
    @oriStop
  end

  def destLine
    @destLine
  end

  def destStop
    @destStop
  end

  def transfer?
    oriLine == destLine
  end

  def numStop
    if oriLine == destLine
      (Trip::MBTA[oriLine].index(oriStop) - Trip::MBTA[destLine].index(destStop)).abs
    else
      (Trip::MBTA[oriLine].index(oriStop) - Trip::MBTA[oriLine].index("Park Street")).abs +
      (Trip::MBTA[destLine].index(destStop) - Trip::MBTA[destLine].index("Park Street")).abs
    end
  end
end

trip = Trip.new(oriLine: "Red", oriStop: "Harvard", destLine: "Green", destStop: "Haymarket")
puts trip.numStop
