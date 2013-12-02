require_relative 'car'
require_relative 'receipt'

class Parkinglot

  attr_reader :count
  attr_reader :name
  def initialize count
    @count = count
    @parkInfo=Hash.new
  end

  def park car

    if space_car_lots()>0
      receipt = Receipt.new('R'+car.id)
      @parkInfo.store(receipt,car)
      receipt
    else
      nil
    end

  end

  def fetch receipt

    @parkInfo.each do |k,v|
      if(k == receipt)
        car = v
        @parkInfo.delete(k)
        return car
      end

    end

    nil

  end

  def space_car_lots
    @count-@parkInfo.size
  end

end

