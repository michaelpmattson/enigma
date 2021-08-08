class Key
  attr_reader :a, :b, :c, :d

  def initialize(num)
    @num = num
    @a = num[0..1].to_i
    @b = num[1..2].to_i
    @c = num[2..3].to_i
    @d = num[3..4].to_i
  end

  def self.make
    normalize_length(random_string_num)
  end

  def self.random_string_num
    rand(100000).to_s
  end

  def self.normalize_length(string_num)
    while string_num.length < 5
      string_num = "0" + string_num
    end
    string_num
  end
end
