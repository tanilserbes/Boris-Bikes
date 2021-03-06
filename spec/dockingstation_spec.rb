require 'dockingstation'

describe DockingStation do
  subject(:dockingstation) {described_class.new}
  let(:bike) {double :bike}


  describe ' #initialize' do
    it {is_expected.to respond_to(:capacity)}
    it {is_expected.to respond_to(:bikes)}
    it 'default value of capacity is 20' do
      docking_station = DockingStation.new(20)
      expect(dockingstation.capacity).to eq 20
    end
  end

  describe '#release' do
    it { is_expected.to respond_to(:release_bike) }

    it 'releases working bikes' do
      bike = double(:bike, working?: true)
      dockingstation.dock(bike)
      expect(dockingstation.release_bike).to be bike
    end

    it 'not release broken bikes' do
      bike = double(:bike, working?: false)
      dockingstation.dock bike
      expect {dockingstation.release_bike}.to raise_error("There are no bikes")
    end

    it 'gives error if no bikes available' do
      expect {dockingstation.release_bike}.to raise_error("There are no bikes")
    end

  end

  describe '#dock' do
    it {is_expected.to respond_to(:dock)}

    it 'bike is docked in dockingstation' do

      expect(dockingstation).to respond_to(:dock).with(1).argument
    end

    it 'if station is full make an error ' do
      bike = double(:bike, working?: true)
      DockingStation::DEFAULT_CAPACITY.times do
        dockingstation.dock bike
      end
      expect {dockingstation.dock bike}.to raise_error("The station is full")
    end

    end
  end
