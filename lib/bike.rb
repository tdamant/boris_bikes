
class Bike
attr_accessor :condition

def initialize(condition=true)
@condition = condition
end

  def working?
    @condition
  end
end
