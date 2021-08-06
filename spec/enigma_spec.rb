require 'date'

RSpec.describe Enigma do
  describe '#initialize' do
    it 'exists and has attributes' do
      enigma = Enigma.new

      expect(enigma).to be_an_instance_of(Enigma)
      # expect(something).to eq(expectation)
    end
  end

  describe '#encrypt(text, key, date)' do
    xit 'encrypts a message with a key and date' do
      enigma = Enigma.new

      # encrypt a message with a key and date
      encryption = enigma.encrypt("hello world", "02715", "040895")
      expectation = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

      expect(encryption).to eq(expectation)
    end

    xit "encrypts a message with a key (uses today's date)" do
      enigma = Enigma.new

      # encrypt a message with a key (uses today's date)
      encrypted = enigma.encrypt("hello world", "02715")
      #=> # encryption hash here
    end

    xit "encrypts a message (generates random key and uses today's date)" do
      enigma = Enigma.new

      # encrypt a message (generates random key and uses today's date)
      enigma.encrypt("hello world")
      #=> # encryption hash here
    end
  end

  describe '#decrypt(ciphertext, key, date)' do
    xit 'decrypts a message with a key and date' do
      enigma = Enigma.new

      # decrypt a message with a key and date
      decryption = enigma.decrypt("keder ohulw", "02715", "040895")
      expectation = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

      expect(decryption).to eq(expectation)
    end

    xit "decrypts a message with a key (uses today's date)" do
      enigma = Enigma.new

      #decrypt a message with a key (uses today's date)
      enigma.decrypt(encrypted[:encryption], "02715")
      #=> # decryption hash here
    end
  end

  describe '#crack(ciphertext, date)' do
    xit 'cracks an encryption with a date' do
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

      expect(crack[:decryption]).to eq(encryption[:encryption])
      expect(crack[:date]).to eq(encryption[:date])
      expect(crack[:key]).to eq(encryption[:key])
    end

    xit "cracks an encryption (uses today's date)" do
      enigma = Enigma.new

      encryption = enigma.encrypt("hello world end", "08304", "291018")

      # crack an encryption (uses today's date)
      crack = enigma.crack("vjqtbeaweqihssi")
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
end
