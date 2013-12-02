require_relative '../lib/parkinglot'
require_relative '../lib/receipt'
require_relative '../lib/parking_boy'

class SmartParkingBoy < ParkingBoy

  def initialize *parkinglots
    super( *parkinglots )
  end

  def park car
    parkinglot = max_car_lot()

    if parkinglot!=nil
      receipt = parkinglot.park(car)
      @client_info[receipt.id] = parkinglot
      receipt
    else
      nil
    end
  end

  private
  def max_car_lot
    max_count = 0
    temp_parkinglot = nil

    @parkinglots.each do |parkinglot|
      if(max_count<parkinglot.count)
        max_count = parkinglot.count
        temp_parkinglot = parkinglot
      end
    end
    temp_parkinglot
  end
end