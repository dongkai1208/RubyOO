require_relative '../lib/parkinglot'

class Person
  attr_reader :car
  def initialize name, car
    @name = name
    @car = car
  end

  #def park
  #  Parkinglot.getInstance().park(@car)
  #end
  #
  #def fetch receipt
  #  Parkinglot.getInstance().fetch(receipt)
  #end
end
