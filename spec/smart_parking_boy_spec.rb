require 'spec_helper'

describe 'SmartParkingBoy' do

  let(:car) { Car.new('001') }
  let(:receipt) { Receipt.new('R001') }

  describe 'park' do

    context 'when successfully' do

      describe 'only one parkinglot with max car losts' do

        let(:parkinglot_a) { Parkinglot.new(4) }
        let(:parkinglot_b) { Parkinglot.new(5) }
        let(:smart_parking_boy) { SmartParkingBoy.new(parkinglot_a, parkinglot_b) }

        it 'should get a receipt from a parkinglot with max car lots' do
          expect(smart_parking_boy.park(car)==receipt).to eq true
          expect(parkinglot_b.space_car_lots()).to eq 4
        end

      end

      describe 'two parkinglots with max car losts' do

        let(:parkinglot_a) { Parkinglot.new(5) }
        let(:parkinglot_b) { Parkinglot.new(5) }
        let(:smart_parking_boy) { SmartParkingBoy.new(parkinglot_a, parkinglot_b) }

        it 'should get a receipt from the first parkinglot with max car lots' do
          expect(smart_parking_boy.park(car)==receipt).to eq true
          expect(parkinglot_a.space_car_lots()).to eq 4
        end

      end

      describe 'only another parkinglot with max car losts' do

        let(:parkinglot_a) { Parkinglot.new(5) }
        let(:parkinglot_b) { Parkinglot.new(3) }
        let(:smart_parking_boy) { SmartParkingBoy.new(parkinglot_a, parkinglot_b) }

        it 'should get a receipt from a parkinglot with max car lots' do
          expect(smart_parking_boy.park(car)==receipt).to eq true
          expect(parkinglot_a.space_car_lots()).to eq 4
        end

      end

    end

    context 'when failed' do
      let(:parkinglot_a) { Parkinglot.new(0) }
      let(:parkinglot_b) { Parkinglot.new(0) }
      let(:smart_parking_boy) { SmartParkingBoy.new(parkinglot_a, parkinglot_b) }

      it 'should get nil' do
        expect(smart_parking_boy.park(car)).to be_nil
      end
    end
  end

  describe 'fetch' do

    let(:parkinglot_a) { Parkinglot.new(5) }
    let(:parkinglot_b) { Parkinglot.new(3) }
    let(:smart_parking_boy) { SmartParkingBoy.new(parkinglot_a, parkinglot_b) }

    context 'when successfully' do

      it 'should get a car' do
        smart_parking_boy.park(car)
        expect(smart_parking_boy.fetch(receipt)==car).to be true
        expect(parkinglot_a.count).to eq 5
      end

    end

    context 'when failed' do

      let(:another_car) { Car.new('002') }
      let(:another_receipt) { Receipt.new('R002') }

      describe 'use a wrong receipt to get a car' do

        it 'should get nil' do
          smart_parking_boy.park(car)
          smart_parking_boy.park(another_car)
          expect(smart_parking_boy.fetch(another_receipt) == car).to eq false
        end

      end
    end

  end
end