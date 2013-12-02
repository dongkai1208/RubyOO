require_relative '../lib/parkinglot'
require_relative '../lib/receipt'

class ParkingBoy

  attr_reader :parkinglots
  attr_reader :client_info

  def initialize(* parkinglots)
    @client_info = {}
    @parkinglots = []
    parkinglots.each do |parkinglot|
      @parkinglots.push(parkinglot)
    end
  end

  def park car
    @parkinglots.each do |parkinglot|
      if parkinglot.count>0
        receipt = parkinglot.park(car)
        @client_info[receipt.id] = parkinglot
        return receipt
      end
    end
   nil
  end

  def fetch receipt
    if (@client_info.has_key?(receipt.id))
      car=@client_info[receipt.id].fetch(receipt)
      @client_info.delete(receipt.id)
      car
    else
      nil
    end
  end
end
