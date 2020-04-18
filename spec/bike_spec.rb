require 'bike'

describe Bike do

  it '#initialize' do
    expect(subject.status).to eq true
    expect(subject.report_broken).to eq false

  end

end
