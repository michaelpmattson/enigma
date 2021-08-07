require_relative 'spec_helper'
require './lib/offset'

RSpec.describe Offset do
  describe '#initialize(date)' do
    it 'exists and has attributes' do
      offset = Offset.new("050821")

      expect(offset).to be_an_instance_of(Offset)
      expect(offset.date).to eq("050821")
      expect(offset.a).to eq(4)
      expect(offset.b).to eq(0)
      expect(offset.c).to eq(4)
      expect(offset.d).to eq(1)
    end

    it 'does not always need a param' do
      offset = Offset.new

      expect(offset).to be_an_instance_of(Offset)
    end
  end

  describe '#todays_date' do
    it 'returns date as six character string' do
      offset = Offset.new
      date = offset.todays_date

      expect(date.length).to eq(6)
      # Test needs edited per date run
      # expect(date).to eq("#{Date.today.strftime("%d%m%y")}")
    end
  end

  describe '#num' do
    it 'returns the last four digits of date squared' do
      offset = Offset.new("050821")

      # 050821 * 050821 = 2582774041
      expect(offset.num).to eq("4041")
    end
  end
end
