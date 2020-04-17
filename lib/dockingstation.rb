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
   
   working_bike = nil
   @bikes.each_with_index do |bike, index|
     if bike.working?
       working_bike = @bikes[index]
       @bikes.delete_at(index)
     end
   end
   
   raise 'There are no bikes' if working_bike == nil
   return working_bike
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
