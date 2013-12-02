class Car

  attr_reader :id

  def initialize id
    @id = id
  end

  def == car
    @id == car.id
  end
end