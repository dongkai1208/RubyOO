require 'spec_helper'

describe 'ParkingBoy' do

  let(:car) { Car.new('001') }
  let(:receipt) { Receipt.new('R001') }

  describe 'park' do

    context 'when successfully' do

      let(:parkinglot_a) { Parkinglot.new(5) }
      let(:parkinglot_b) { Parkinglot.new(4) }
      let(:parking_boy) { ParkingBoy.new(parkinglot_a, parkinglot_b)}

      it 'should get a receipt' do
        expect(parking_boy.park(car)==receipt).to eq true
        expect(parkinglot_a.space_car_lots()).to eq 4
      end

    end

    context 'failed' do
      let(:parkinglot_a) { Parkinglot.new(0) }
      let(:parkinglot_b) { Parkinglot.new(0) }
      let(:parkinglot_c) { Parkinglot.new(0) }
      let(:parking_boy) { ParkingBoy.new(parkinglot_a, parkinglot_b, parkinglot_c)}
      it 'should get nil' do
        expect(parking_boy.park(car)).to be_nil
      end
    end

  end

  describe 'fetch' do

    let(:parkinglot_a) { Parkinglot.new(0) }
    let(:parkinglot_b) { Parkinglot.new(4) }
    let(:parking_boy) { ParkingBoy.new(parkinglot_a, parkinglot_b) }

    context 'successfully' do

      it 'should get a car' do
        parking_boy.park(car)
        expect(parking_boy.fetch(receipt)==car).to eq true
        expect(parkinglot_b.count).to eq 4
      end
    end

    context 'failed' do
      let(:another_car) { Car.new('002') }
      let(:another_receipt) { Receipt.new('R002')}

      it 'should get nil' do
        parking_boy.park(car)
        expect(parking_boy.fetch(another_receipt)==car).to eq false
        expect(parkinglot_b.space_car_lots()).to eq 3
      end

    end

  end
end