require 'date'

RSpec.describe Enigma do
  describe '#initialize' do
    it 'exists and has attributes' do
      enigma = Enigma.new

      expect(something).to be_an_instance_of(expectation)
      expect(something).to eq(expectation)
    end
  end

  describe '#encrypt()' do
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

  describe '#decrypt()' do
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
end
