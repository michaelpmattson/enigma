class Key
  attr_reader :num, :a, :b, :c, :d

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

  def self.find_key(shifts)
    key = 0
    moduli = []

    until moduli == shifts
      str_key = Key.normalize_length(key.to_s)
      keys = [str_key[0..1], str_key[1..2], str_key[2..3], str_key[3..4]]

      moduli = keys.map do |key|
        key.to_i % 27
      end
      key += 1

      return "Key too long" if key > 99999
    end
    key -= 1
    Key.normalize_length(key.to_s)
  end
end
