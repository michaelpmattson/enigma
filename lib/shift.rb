require_relative 'key'
require_relative 'offset'

class Shift
  attr_reader :a, :b, :c, :d

  def initialize(num, date)
    @key    = Key.new(num)
    @offset = Offset.new(date)
    @a      = @key.a + @offset.a
    @b      = @key.b + @offset.b
    @c      = @key.c + @offset.c
    @d      = @key.d + @offset.d
  end
end
