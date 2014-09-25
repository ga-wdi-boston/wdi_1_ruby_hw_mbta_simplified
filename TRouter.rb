require 'pry'

class TeeRouter

  @@routes = {
    redline: ["Alewife","Davis","Porter","Harvard","Central","Kendall/MIT","Park Street","South Station"],
    greenline: ["Haymarket","Government Center","Park Street","Boylston","Arlington","Copley"],
    orangeline: ["North Station","Haymarket","Park Street","State Street","Downtown Crossing","China Town","Tufts Medical Center"]
  }

  def initialize(string)
    info = string.scan(/[\w]+/im) # => ["...", "...", "...", "..."]
    parse_destinations(info)
  end

  def parse_destinations(array)
    binding.pry #breakpoint



  end

end

puts "Enter: departure line, departure station, arrival line, arrival station (comma separated values)"
TeeRouter.new(gets.chomp)

# Redline, Harvard, OrangeLine, Chinatown
