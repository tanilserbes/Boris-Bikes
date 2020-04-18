require 'bike'

describe Bike do
  it '#working' do
    expect(subject).to respond_to(:working?)
  end

  it '#initialize' do
    expect(subject.status).to eq true
    expect(subject.report_broken).to eq false
  end

end
