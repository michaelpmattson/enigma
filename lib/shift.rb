require_relative 'key'
require_relative 'offset'

class Shift
  # constants
  ALPHABET = ("a".."z").to_a << " "

  attr_reader :map

  def initialize(key, offset)
    @key    = key
    @offset = offset
    # require "pry"; binding.pry
    @map    = {
      a: @key.a + @offset.a,
      b: @key.b + @offset.b,
      c: @key.c + @offset.c,
      d: @key.d + @offset.d
    }
  end

  def right(char, key_letter)
    return char if special_char?(char)
    shift = (ALPHABET.index(char) + map[key_letter]) % 27
    ALPHABET[shift]
  end

  def left(char, key_letter)
    return char if special_char?(char)
    shift = (ALPHABET.index(char) - map[key_letter]) % 27
    ALPHABET[shift]
  end

  def special_char?(char)
    !ALPHABET.include?(char)
  end

end
