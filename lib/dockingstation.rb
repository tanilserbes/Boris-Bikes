require_relative 'bike'

class DockingStation
  
  DEFAULT_CAPACITY = 20
  
  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
   raise 'There are no bikes' if empty?
   raise 'There are no bikes' if !@bikes[0].working?
   @bikes.pop
  end

  def dock(bike, working = true)
    raise 'the dock is full' if full?
    bike.state = working
    @bikes << bike
  end
  
  private
  
  def full?
    @bikes.length >= DEFAULT_CAPACITY
  end
  
  def empty?
    @bikes.empty?
  end

end
