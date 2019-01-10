
class Bike
attr_reader :condition

  def initialize(condition=true)
  @condition = condition
  end

  def is_broken
    @condition = false
    self
  end

end
