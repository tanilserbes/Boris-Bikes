require_relative 'bike'

class DockingStation
attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
   raise 'There are no bikes' if @bikes.empty?
   @bikes.pop
  end

  def dock(bike)
    raise 'the dock is full' if @bikes.length >= 20
    @bikes << bike
  end

end
