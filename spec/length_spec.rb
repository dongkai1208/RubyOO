require 'rspec'
require_relative '../lib/length'

describe 'Length' do

  describe 'Length == function' do

    let(:length1) { Length.new(1, 'M') }
    let(:length2) { Length.new(1, 'M') }

    #it 'should 1m equals 1m' do
    #   expect(length1.to_equal(length2)).to eq(true)
    #end

    it 'should 1m equals 1m' do
      expect(length1 == length2).to eq(true)
    end

  end
  #
  #describe 'another Length compare function' do
  #
  #  it 'should 1m equals 1m' do
  #    expect(length1.equal? length2).to eq(true)
  #  end
  #
  #end
  #  it 'should 1 equals 1' do
  #    expect(length1.value equal? length2.value).to eq(true)
  #  end

  describe 'Length > and < function' do

    let(:length1) {Length.new(2, 'M')}
    let(:length2) {Length.new(1, 'M')}

    it 'should 2m > 1m' do
      expect(length1 > length2).to eq(true)
    end

    it 'should 1m < 2m' do
      expect(length2 < length1).to eq(true)
    end

  end


end