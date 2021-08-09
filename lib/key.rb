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

  # def self.find_key(shifts)
  #   current = shifts[0]
  #   i = 0
  #   while i % 27 != current
  #     i += 1
  #   end
  #
  #   current = shifts[1]
  #   j = (i.to_s[-1] + 0.to_s).to_i
  #   while j % 27 != current
  #     j += 1
  #   end
  #
  #   current = shifts[2]
  #   k = (j.to_s[-1] + 0.to_s).to_i
  #   while k % 27 != current
  #     k += 1
  #   end
  #
  #   current = shifts[3]
  #   l = (k.to_s[-1] + 0.to_s).to_i
  #   while l % 27 != current
  #     l += 1
  #   end
  #
  #   require "pry"; binding.pry
  # end





  # def self.find_key(shifts)
  #   key = ""
  #   shifts.each_with_index do |shift|
  #     if key == ""
  #       current = (key += "0").to_i
  #     else
  #       current = (key[-1] + "0").to_i
  #     end
  #
  #     while current % 27 != shift
  #       current += 1
  #     end
  #     key = key += current.to_s[-1]
  #     # require "pry"; binding.pry
  #   end
  #   key
  # end

  def self.find_key(shifts, first)
    key = ""
    current = 0
    if first < 10
      key = "0"
    else
      key = first.to_s[0]
    end
    shifts.each do |shift|
      current = (key[-1] + "0").to_i
      while current % 27 != shift
        current += 1
      end
      require "pry"; binding.pry

      if current < 10
        key = key + current.to_s
      elsif key[-1] == current.to_s[0]
        key = key += current.to_s[-1]
      else

        if current + 27 < 100
          # step up the current and start over ?
          return Key.find_key(shifts, first + 27)
        else
          return Key.find_key(shifts, first + 27)
        end


      end

    end
    key
  end
end
