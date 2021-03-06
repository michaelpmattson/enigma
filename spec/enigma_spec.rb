require_relative 'spec_helper'
require './lib/enigma'
require 'date'

RSpec.describe Enigma do
  # before(:each) do
  #   enigma = Enigma.new
  # end

  describe '#initialize' do
    it 'exists and has attributes' do
      enigma = Enigma.new

      expect(enigma).to be_an_instance_of(Enigma)
    end
  end

  describe '#encrypt(text, key, date)' do
    it 'encrypts a message with a key and date' do
      enigma = Enigma.new
      encrypt = enigma.encrypt("hello world", "02715", "040895")
      expectation = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

      expect(encrypt).to eq(expectation)
    end

    it "encrypts a message with a key (uses today's date)" do
      allow(Date).to receive(:today).and_return(Date.new(1995, 8, 4))
      enigma = Enigma.new

      encrypt = enigma.encrypt("hello world", "02715")
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
      enigma = Enigma.new

      allow(Key).to receive(:rand).and_return(2715)
      # encrypt a message (generates random key and uses today's date)
      encrypt = enigma.encrypt("hello world")

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
      enigma = Enigma.new
      enigma.make_shift("02715", "040895")

      encryption = enigma.encryption("hello world", "02715")

      expect(encryption).to eq("keder ohulw")
    end
  end

  describe '#decrypt(ciphertext, key, date)' do
    it 'decrypts a message with a key and date' do
      enigma = Enigma.new
      decrypt = enigma.decrypt("keder ohulw", "02715", "040895")

      expectation = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

      expect(decrypt).to eq(expectation)
    end

    it "decrypts a message with a key (uses today's date)" do
      allow(Date).to receive(:today).and_return(Date.new(1995, 8, 4))
      enigma = Enigma.new
      encrypted = enigma.encrypt("hello world", "02715")
      decrypted = enigma.decrypt(encrypted[:encryption], "02715")

      expectation = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

      expect(decrypted).to eq(expectation)
    end
  end

  describe '#crack(ciphertext, date)' do
    it 'cracks an encryption with a date' do
      enigma = Enigma.new
      encryption = enigma.encrypt("hello world end", "08304", "291018")
      #=>
      #   {
      #     encryption: "vjqtbeaweqihssi",
      #     key: "08304",
      #     date: "291018"
      #   }

      # crack an encryption with a date
      crack = enigma.crack("vjqtbeaweqihssi", "291018")
      #=>
      #   {
      #     decryption: "hello world end",
      #     date: "291018",
      #     key: "08304"
      #   }

      expect(crack[:decryption]).to eq("hello world end")
      expect(crack[:date]).to eq(encryption[:date])
      expect(crack[:key]).to eq(encryption[:key])
    end

    it "cracks an encryption (uses today's date)" do
      enigma = Enigma.new
      encrypted = enigma.encrypt("hello world end", "08304", Date.today.strftime("%d%m%y"))

      # crack an encryption (uses today's date)
      crack = enigma.crack(encrypted[:encryption])
      #=>
      #   {
      #     decryption: "hello world end",
      #     date: # todays date in the format DDMMYY,
      #     key: # key used for encryption
      #   }

      expect(crack[:decryption]).to eq("hello world end")
      expect(crack[:date]).to eq(Date.today.strftime("%d%m%y"))
      expect(crack[:key]).to eq(encrypted[:key])
    end
  end

  describe '#find_end_position(ciphertext)' do
    it 'returns number of characters A shift is from the end' do
      enigma = Enigma.new
      encryption = enigma.encrypt("hello world end", "08304", "291018")

      expect(enigma.find_end_position("vjqtbeaweqihssi")).to eq(3)
    end
  end

  describe '#last_four(ciphertext)' do
    it 'returns last four characters' do
      enigma = Enigma.new
      ciphertext = "vjqtbeaweqihssi"

      expect(enigma.last_four(ciphertext)).to eq("hssi")
    end
  end
end
