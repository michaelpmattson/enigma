require_relative 'spec_helper'
require './lib/shift'

RSpec.describe Shift do
  describe '#initialize' do
    it 'exists and has attributes' do
      shift = Shift.new(Key.new("72394"), Offset.new("050821"))

      expect(shift).to be_an_instance_of(Shift)

      expect(shift.a).to eq(76)
      expect(shift.b).to eq(23)
      expect(shift.c).to eq(43)
      expect(shift.d).to eq(95)
    end
  end

  describe '#right(char, key_letter)' do
    it 'shifts to the right based on the key' do
      shift = Shift.new(Key.new("72394"), Offset.new("050821"))
      # a: 76, b: 23, c: 43, d: 95

      char_1 = "a"

      expect(shift.right(char_1, :a)).to eq("w")
      expect(shift.right(char_1, :b)).to eq("x")
    end

    it 'can start over at the end of alphabet' do
      shift = Shift.new(Key.new("72394"), Offset.new("050821"))
      # shift_map = { a: 76, b: 23, c: 43, d: 95 }
      char_2 = "m"

      expect(shift.right(char_2, :a)).to eq("h")
      expect(shift.right(char_2, :b)).to eq("i")
    end
  end

  describe '.find_shift(last_four, end_position, date)' do
    it 'something' do
      last_four = "hssi"
      end_position = 3
      date = "291018"
      shift = Shift.find_shift(last_four, end_position, date)

      expect(shift.a).to eq(14)
      expect(shift.b).to eq(86)
      expect(shift.c).to eq(32)
      expect(shift.d).to eq(8)
    end
  end
end
