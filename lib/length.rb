class Length
  # To change this template use File | Settings | File Templates.
  attr_reader :value, :unit

  def initialize(value, unit)
    @value = value
    @unit = unit
  end

  def to_equal? length
    length.value == @value
  end

  def == length
    @value == length.value && @unit == length.unit
  end

  def > length
    @value > length.value && @unit == length.unit
  end

  def < length
    @value < length.value && @unit == length.unit
  end

end