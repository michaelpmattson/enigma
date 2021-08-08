require 'Date'
require_relative 'shift'
require_relative 'key'
require_relative 'offset'

class Enigma
  attr_reader :shift

  def initialize
    @shift  = nil
  end

  def make_shift(key, date)
    @shift = Shift.new(Key.new(key), Offset.new(date))
  end

  def encrypt(text, key = Key.make, date = Offset.todays_date)
    make_shift(key, date)
    {
      encryption: encryption(text, date),
      key: key,
      date: date
    }
  end

  def encryption(text, date)
    text_array = text.chars
    text_array.map.with_index do |char, index|
      if    index % 4 == 0
        @shift.right(char, :a)
      elsif index % 4 == 1
        @shift.right(char, :b)
      elsif index % 4 == 2
        @shift.right(char, :c)
      elsif index % 4 == 3
        @shift.right(char, :d)
      end
    end.join
  end

  def decrypt(ciphertext, key, date = Offset.todays_date)
    make_shift(key, date)
    {
      decryption: decryption(ciphertext, key, date),
      key: key,
      date: date
    }
  end

  def decryption(ciphertext, key, date)
    text_array = ciphertext.chars
    text_array.map.with_index do |char, index|
      if    index % 4 == 0
        @shift.left(char, :a)
      elsif index % 4 == 1
        @shift.left(char, :b)
      elsif index % 4 == 2
        @shift.left(char, :c)
      elsif index % 4 == 3
        @shift.left(char, :d)
      end
    end.join
  end
end
