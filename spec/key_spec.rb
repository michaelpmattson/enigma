require_relative 'spec_helper'
require './lib/key'

RSpec.describe Key do
  describe '#initialize' do
    it 'exists and has attributes' do
      key = Key.new("02715")

      expect(key).to be_an_instance_of(Key)
      # expect(key.num).to eq("02715")
      expect(key.a).to eq(02)
      expect(key.b).to eq(27)
      expect(key.c).to eq(71)
      expect(key.d).to eq(15)
    end
  end

  describe '#make' do
    it 'generates a random five digit number' do
      num = Key.make

      expect(num.length).to eq(5)
    end

    it 'adds leading zeroes to random numbers less than five digits' do
      allow(Key).to receive(:rand).and_return(349)
      num = Key.make

      expect(num).to eq("00349")
    end
  end

  describe '#find_key(shifts)' do
    xit "can find a key with each shift's modulus" do
      shifts = [8, 2, 3, 4]

      expect(Key.find_key(shifts)).to eq("08304")
    end

    xit 'can find a key that starts above 10' do
      shifts = [22, 23, 16, 14]

      expect(Key.find_key(shifts)).to eq("72394")
    end
  end
end
