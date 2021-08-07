require_relative 'spec_helper'
require './lib/shift'

RSpec.describe Shift do
  describe '#initialize' do
    it 'exists and has attributes' do
      shift = Shift.new("72394", "050821")

      expect(shift).to be_an_instance_of(Shift)
      expect(shift.a).to eq(76)
      expect(shift.b).to eq(23)
      expect(shift.c).to eq(43)
      expect(shift.d).to eq(95)
    end
  end
end
