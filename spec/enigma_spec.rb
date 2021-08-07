require_relative 'spec_helper'
require './lib/enigma.rb'
require 'date'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  describe '#initialize' do
    it 'exists and has attributes' do

      expect(@enigma).to be_an_instance_of(Enigma)
      # expect(something).to eq(expectation)
    end
  end

  describe '#encrypt(text, key, date)' do
    it 'encrypts a message with a key and date' do
      # encrypt a message with a key and date
      encrypt = @enigma.encrypt("hello world", "02715", "040895")
      expectation = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

      expect(encrypt).to eq(expectation)
    end

    it "encrypts a message with a key (uses today's date)" do
      allow(Date).to receive(:today).and_return(Date.new(1995, 8, 4))
      # encrypt a message with a key (uses today's date)
      encrypt = @enigma.encrypt("hello world", "02715")
      #=> # encryption hash here
      expectation = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

      expect(encrypt).to eq(expectation)
    end

    it "encrypts a message (generates random key and uses today's date)" do
      allow(Date).to receive(:today).and_return(Date.new(1995, 8, 4))
      allow(@enigma).to receive(:rand).and_return(2715)
      # encrypt a message (generates random key and uses today's date)
      encrypt = @enigma.encrypt("hello world")
      #=> # encryption hash here
      expectation = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

      expect(encrypt).to eq(expectation)
    end
  end

  describe '#encryption(text)' do
    it 'returns the encryption' do
      encryption = @enigma.encryption("hello world", "02715", "040895")

      expect(encryption).to eq("keder ohulw")
    end
  end

  describe '#shift_char(char, key_letter)' do
    it 'shifts to the right based on the key' do
      shift_map = { a: 76, b: 23, c: 43, d: 95 }
      char_1 = "a"

      expect(@enigma.shift_char(char_1, :a, shift_map)).to eq("w")
      expect(@enigma.shift_char(char_1, :b, shift_map)).to eq("x")
    end

    it 'can start over at the end of alphabet' do
      shift_map = { a: 76, b: 23, c: 43, d: 95 }
      char_2 = "m"

      expect(@enigma.shift_char(char_2, :a, shift_map)).to eq("h")
      expect(@enigma.shift_char(char_2, :b, shift_map)).to eq("i")
    end
  end

  describe '#decrypt(ciphertext, key, date)' do
    it 'decrypts a message with a key and date' do
      # decrypt a message with a key and date
      decrypt = @enigma.decrypt("keder ohulw", "02715", "040895")
      expectation = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

      expect(decrypt).to eq(expectation)
    end

    it "decrypts a message with a key (uses today's date)" do
      allow(Date).to receive(:today).and_return(Date.new(1995, 8, 4))
      encrypted = @enigma.encrypt("hello world", "02715")
      #decrypt a message with a key (uses today's date)
      decrypted = @enigma.decrypt(encrypted[:encryption], "02715")
      #=> # decryption hash here
      expectation = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

      expect(decrypted).to eq(expectation)
    end
  end

  describe '#crack(ciphertext, date)' do
    xit 'cracks an encryption with a date' do
      encryption = @enigma.encrypt("hello world end", "08304", "291018")
      #=>
      #   {
      #     encryption: "vjqtbeaweqihssi",
      #     key: "08304",
      #     date: "291018"
      #   }

      # crack an encryption with a date
      crack = @enigma.crack("vjqtbeaweqihssi", "291018")
      #=>
      #   {
      #     decryption: "hello world end",
      #     date: "291018",
      #     key: "08304"
      #   }

      expect(crack[:decryption]).to eq(encryption[:encryption])
      expect(crack[:date]).to eq(encryption[:date])
      expect(crack[:key]).to eq(encryption[:key])
    end

    xit "cracks an encryption (uses today's date)" do
      encryption = @enigma.encrypt("hello world end", "08304", "291018")

      # crack an encryption (uses today's date)
      crack = @enigma.crack("vjqtbeaweqihssi")
      #=>
      #   {
      #     decryption: "hello world end",
      #     date: # todays date in the format DDMMYY,
      #     key: # key used for encryption
      #   }

      expect(crack[:decryption]).to eq(encryption[:encryption])
      # expect(crack[:date]).to eq(# todays date)
      expect(crack[:key]).to eq(encryption[:key])
    end
  end

  describe '#make_key' do
    it 'generates a random five digit number' do
      key = @enigma.make_key

      expect(key.length).to eq(5)
    end

    it 'adds leading zeroes to random numbers less than five digits' do
      allow(@enigma).to receive(:rand).and_return(349)
      key = @enigma.make_key

      expect(key.length).to eq(5)
    end
  end

  describe '#todays_date' do
    it 'returns date as six character string' do
      date = @enigma.todays_date

      expect(date.length).to eq(6)
      # Test needs edited per date run
      # expect(date).to eq("#{Date.today.strftime("%d%m%y")}")
    end
  end

  describe '#offset(date)' do
    it 'returns the last four digits of date squared' do
      allow(Date).to receive(:today).and_return(Date.new(2021, 8, 5))
      offset = @enigma.offset(@enigma.todays_date) # 050821

      # 050821 * 050821 = 2582774041
      expect(offset).to eq("4041")
    end
  end

  describe '#key_map(key)' do
    it 'returns a hash of keys for A-D' do
      key_map = @enigma.key_map("72394")

      expectation = {
        a: 72,
        b: 23,
        c: 39,
        d: 94
      }

      expect(key_map).to eq(expectation)
    end
  end

  describe '#shift_map(key, offset)' do
    it 'returns a hash of shifts A-D' do
        shift_map = @enigma.shift_map("72394", "4041")

        expectation = {
          a: 76,
          b: 23,
          c: 43,
          d: 95
        }

        expect(shift_map).to eq(expectation)
    end
  end
end


 # @date = Date.today.strftime("%d/%m/%Y")
# allow(Date).to receive(:today).and_return(Date.new(2020, 01, 24))
# expect(@event.date).to eq('24/01/2020')
