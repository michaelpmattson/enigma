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
    encrypt_vals(text, key, date)
  end

  def encrypt_vals(text, key, date)
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
    decrypt_vals(ciphertext, key, date)
  end

  def decrypt_vals(ciphertext, key, date)
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

  def crack(ciphertext, date = Offset.todays_date)
    end_position = find_end_position(ciphertext)
    last_four = last_four(ciphertext)
    shift = Shift.find_shift(last_four, end_position, date)
    key = shift.key.num
    decryption = decrypt_vals(ciphertext, key, date)
  end

  def find_end_position(ciphertext)
    ciphertext.length % 4
  end

  def last_four(ciphertext)
    ciphertext.slice(-4, 4)
  end
end
