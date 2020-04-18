class Bike
attr_reader :status

def initialize
  @status = true
end

def report_broken
  @status = false
end


end
