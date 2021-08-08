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
    # shift_map = shift_map(offset(date))
    text_array = text.chars
    encryption_array = []
    text_array.each_with_index do |char, index|
      if    index % 4 == 0
        encryption_array << @shift.right(char, :a) # a
      elsif index % 4 == 1
        encryption_array << @shift.right(char, :b) # b
      elsif index % 4 == 2
        encryption_array << @shift.right(char, :c) # c
      elsif index % 4 == 3
        encryption_array << @shift.right(char, :d) # d
      else
        # nothing, shouldn't get here.
      end
    end
    enc = encryption_array.join
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
    # shift_map = shift_map(key, offset(date))
    text_array = ciphertext.chars
    decryption_array = []
    text_array.each_with_index do |char, index|
      if    index % 4 == 0
        decryption_array << @shift.left(char, :a) # a
      elsif index % 4 == 1
        decryption_array << @shift.left(char, :b) # b
      elsif index % 4 == 2
        decryption_array << @shift.left(char, :c) # c
      elsif index % 4 == 3
        decryption_array << @shift.left(char, :d) # d
      else
        # nothing, shouldn't get here.
      end
    end
    dec = decryption_array.join
  end
end
