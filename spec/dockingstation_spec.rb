require 'dockingstation'
require 'bike'
describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

   it 'raises an error when there are no bikes' do
     expect{subject.release_bike}.to raise_error('There are no bikes')
   end

   it { is_expected.to respond_to(:dock).with(1).argument }

  describe "#dock" do

   it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to include bike
   end

   context "when the dock is full" do
     it "raises an error 'the dock is full'" do
       DockingStation::DEFAULT_CAPACITY.times {subject.dock(Bike.new)}
       expect { subject.dock(Bike.new) }.to raise_error('the dock is full')
     end
   end
   
   context "when the bike is broken" do
     it "is reported to be broken" do
       bike = Bike.new
       subject.dock(bike, false)
       expect(subject.bikes[0].working?).to be false
     end
   end
  end
  
  describe "#initialize" do
    context "with a custom capacity" do
      subject { described_class.new(40) }
      it "has a capacity of 40 when created with a capacity of 40" do
        expect(subject.capacity).to eq(40)
      end
    end
    context "with a default capacity" do
      subject { described_class.new }
      it "has a default capacity" do
        expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
      end
    end
  end
end
