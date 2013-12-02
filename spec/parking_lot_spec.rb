require 'spec_helper'

describe 'Parkinglot' do

  let(:car) { Car.new('001') }
  let(:receipt) { Receipt.new ('R001') }

  describe 'park' do

    context 'when successfully' do

      let(:parkinglot) { Parkinglot.new(2) }

        it 'should get a receipt' do
          expect(parkinglot.park(car) == receipt).to eq true
          expect(parkinglot.space_car_lots()).to eq(1)
        end

      end

    end

    context 'when failed' do

      let(:parkinglot) { Parkinglot.new(0) }

        it 'should get nil' do
          expect(parkinglot.park(car)).to eq nil
          expect(parkinglot.space_car_lots()).to eq(0)
        end
      end

  end

  describe 'fetch' do

    let(:parkinglot) { Parkinglot.new(2) }

    let(:another_car) {Car.new('002')}
    let(:another_receipt) { Receipt.new ('R002') }

    context 'successfully' do

        it 'should get a car' do

          parkinglot.park(car)
          expect(parkinglot.fetch(receipt)==car).to eq true
          expect(parkinglot.count).to eq 2

        end

    end

    context 'failed' do

        it 'should get nil without park a car before' do
          expect(parkinglot_a.fetch(receipt) == car ).to eq false
          expect(parkinglot_a.count).to eq(2)
        end

        it 'should get nil when use a wrong receipt' do
          require "debugger"; debugger
          parkinglot_a.park(car)
          parkinglot_a.park(another_car)
          expect(parkinglot_a.fetch(another_receipt) == car ).to eq false
          expect(parkinglot_a.count).to eq(0)
        end

    end
  end


