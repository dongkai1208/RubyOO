require 'spec_helper'

describe 'SmarterParkingBoy' do

  let(:car) { Car.new('001') }
  let(:receipt) { Receipt.new('R001') }

  describe 'park' do

    let(:car_a) { Car.new('002') }
    let(:car_b) { Car.new('003') }
    let(:car_c) { Car.new('004') }

    context 'when successfully' do

      let(:parkinglot_a) { Parkinglot.new(4) }
      let(:parkinglot_b) { Parkinglot.new(5) }
      let(:parkinglot_c) { Parkinglot.new(6) }
      let(:smarter_parking_boy) { SmarterParkingBoy.new(parkinglot_a, parkinglot_b, parkinglot_c)}

      it 'should get a receipt from a parking_lot which has max spec car lots ratio' do
        expect(smarter_parking_boy.park(car)==receipt).to eq true
        expect(parkinglot_a.space_car_lots()).to eq 3
      end

      it 'should get a receipt from a parking_lot which has max spec car lots ratio' do
        parkinglot_a.park(car_a)
        parkinglot_b.park(car_b)
        parkinglot_c.park(car_c)

        expect(smarter_parking_boy.park(car)==receipt).to eq true
        expect(parkinglot_c.space_car_lots()).to eq 4
      end

    end

    context 'when failed' do

      let(:parkinglot_a) { Parkinglot.new(0) }
      let(:parkinglot_b) { Parkinglot.new(0) }
      let(:smarter_parking_boy) { SmarterParkingBoy.new(parkinglot_a, parkinglot_b) }

      it 'should get nil' do
        expect(smarter_parking_boy.park(car)).to be_nil
      end

    end

  end

  describe 'fetch' do

    let(:parkinglot_a) { Parkinglot.new(4) }
    let(:parkinglot_b) { Parkinglot.new(5) }
    let(:parkinglot_c) { Parkinglot.new(6) }
    let(:smarter_parking_boy) { SmarterParkingBoy.new(parkinglot_a, parkinglot_b, parkinglot_c)}

    context 'when successfully' do

      it 'should get a car' do
        smarter_parking_boy.park(car)

        expect(smarter_parking_boy.fetch(receipt)==car).to eq true
        expect(parkinglot_a.space_car_lots()).to eq 4
      end

    end

    context 'when failed' do

      it 'should get nil' do
        expect(smarter_parking_boy.fetch(receipt)==car).to eq false
      end
    end

  end
end