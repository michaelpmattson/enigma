class Offset
  attr_reader :date, :a, :b, :c, :d

  def initialize(date)
    @date = date
    @a = num[0].to_i
    @b = num[1].to_i
    @c = num[2].to_i
    @d = num[3].to_i
  end

  def num
    date = @date.to_i
    squared = date * date
    squared.to_s.slice(-4, 4)
  end
end
