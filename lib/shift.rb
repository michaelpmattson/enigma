require_relative 'key'
require_relative 'offset'

class Shift
  ALPHABET = ("a".."z").to_a << " "

  attr_reader :key, :a, :b, :c, :d

  def initialize(key, offset)
    @key    = key
    @offset = offset
    @a      = @key.a + @offset.a
    @b      = @key.b + @offset.b
    @c      = @key.c + @offset.c
    @d      = @key.d + @offset.d
  end

  def right(char, key_letter)
    return char if special_char?(char)
    shift = (ALPHABET.index(char) + send(key_letter)) % 27
    ALPHABET[shift]
  end

  def left(char, key_letter)
    return char if special_char?(char)
    shift = (ALPHABET.index(char) - send(key_letter)) % 27
    ALPHABET[shift]
  end

  def special_char?(char)
    !ALPHABET.include?(char)
  end

  def self.find_shift(last_four, end_position, date)
    last_four = last_four.split('')
    enemy_end = ' end'.split('')
    abcd = [:a, :b, :c, :d].rotate(end_position)
    offset = Offset.new(date)

    keys = []
    last_four.each_with_index do |char, index|
      alpha = ALPHABET.index(enemy_end[index])
      chardex = ALPHABET.index(char)
      shift = (chardex - alpha) % 27
      key = shift - offset.send(abcd[index])
      keys << key
    end

    keys = keys.rotate(-end_position)
    key = Key.find_key(keys)

    shift = Shift.new(Key.new(key), offset)
  end
end
