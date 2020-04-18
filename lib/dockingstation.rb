require_relative 'bike'

class DockingStation
  attr_accessor :capacity
  attr_reader :bikes
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
   @bikes = []
   @capacity = capacity
 end

  def release_bike
    @bikes.each_with_index do |bike, index|
      if bike.working? == false
         bike = @bikes.delete_at(index)
      end
    end
    raise "There are no bikes" if empty?
    return @bikes.pop
  end

  def dock(bike)
    raise "The station is full" if full?
    @bikes << bike
    end

  private
    def full?
      @bikes.count >= @capacity
    end

    def empty?
      @bikes.empty?
    end


end
