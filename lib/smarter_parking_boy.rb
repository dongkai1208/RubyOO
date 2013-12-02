require_relative '../lib/parkinglot'
require_relative '../lib/receipt'
require_relative '../lib/parking_boy'

class SmarterParkingBoy < ParkingBoy

  def initialize ( *parkinglots )
    super( *parkinglots )
  end

  def park(car)
    parkinglot = max_car_lot_ratio()

    if parkinglot!=nil
      receipt = parkinglot.park(car)
      @client_info[receipt.id] = parkinglot
      receipt
    else
      nil
    end
  end

  private
  def max_car_lot_ratio
    max_ratio = 0
    temp_parkinglot = nil

    @parkinglots.each do |parkinglot|
      temp_ratio = parkinglot.space_car_lots()/(parkinglot.count).to_f
      if( max_ratio < temp_ratio )
        max_ratio = temp_ratio
        temp_parkinglot = parkinglot
      end
    end
    temp_parkinglot
  end

end