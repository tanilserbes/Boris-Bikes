require 'dockingstation'
require 'bike'
describe DockingStation do

  it {is_expected.to respond_to(:release_bike)}

  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    bike = subject.release_bike
    expect(bike).to be_working
  end

   it 'raises an error when there are no bikes' do
     expect{subject.release_bike}.to raise_error('There are no bikes')
   end

   it {is_expected.to respond_to(:dock).with(1).argument}

  describe "#dock" do

   it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to include bike
   end

   context "when the dock is full" do
     it "raises an error 'the dock is full'" do
       20.times {subject.dock(Bike.new)}
       expect { subject.dock(Bike.new) }.to raise_error('the dock is full')
     end
   end
  end


end
