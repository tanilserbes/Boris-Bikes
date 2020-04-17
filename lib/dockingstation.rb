require_relative 'bike'

class DockingStation
attr_reader :bike

  def release_bike
   raise 'There are no bikes' if !@bike
   Bike.new
  end

  def dock(bike)
    @bike = bike
  end

end
