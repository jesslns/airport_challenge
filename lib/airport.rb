require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 80

attr_reader :planes, :weather, :capacity

def initialize(capacity=DEFAULT_CAPACITY, weather = Weather.new)
  @capacity = capacity
  @planes = []
  @weather = weather
end

def land(plane, weather)
  @weather = weather
  fail "Landing is forbidden!" if stormy?
  fail "Airport is full!" if full?
  @planes << plane
  return plane
end

def take_off(plane, weather)
  @weather = weather
  fail "Take off is forbidden!" if stormy?
  @planes - [plane]
  return @planes.include?(plane)
end

private

def stormy?
  @weather == true
end

def full?
  @planes.count >= @capacity
end

end
