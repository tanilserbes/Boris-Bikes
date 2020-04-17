require 'bike'
require 'dockingstation'
describe Bike do
  it{is_expected.to respond_to(:working?)}
  it{is_expected.to respond_to(:state)}

  it 'is working when first created' do 
    expect(subject.state).to be true
  end
end
