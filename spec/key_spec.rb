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

    it 'does not always need a param' do
      # allow(Integer).to receive(:rand).and_return(2715)
      key = Key.new

      expect(key).to be_an_instance_of(Key)
      # expect(key.num).to eq("02715")
    end
  end

  describe '#make' do
    it 'generates a random five digit number' do
      key = Key.new
      num = key.make

      expect(num.length).to eq(5)
    end

    it 'adds leading zeroes to random numbers less than five digits' do
      key = Key.new
      allow(key).to receive(:rand).and_return(349)
      num = key.make

      expect(num).to eq("00349")
    end
  end
end
