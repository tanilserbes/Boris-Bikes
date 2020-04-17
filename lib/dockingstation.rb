require_relative 'bike'

class DockingStation
attr_reader :bike

  def release_bike
   raise 'There are no bikes' if !@bike
   @bike
  end

  def dock(bike)
    raise 'the dock is full' if @bike
    @bike = bike
  end

end
