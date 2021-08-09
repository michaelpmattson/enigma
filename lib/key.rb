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

  # def self.find_key(shifts, first)
  #   key = ""
  #   current = 0
  #   if first < 10
  #     key = "0"
  #   else
  #     key = first.to_s[0]
  #   end
  #   shifts.each do |shift|
  #     current = (key[-1] + "0").to_i
  #     while current % 27 != shift
  #       current += 1
  #     end
  #     # require "pry"; binding.pry
  #
  #     if current < 10
  #       key = key + current.to_s
  #     elsif key[-1] == current.to_s[0]
  #       key = key += current.to_s[-1]
  #     else
  #
  #       return Key.find_key(shifts, first + 27)
  #
  #
  #     end
  #
  #   end
  #   key
  # end

  # def self.find_key(shifts)
  #   key = ""
  #   if shifts[0] < 10
  #     key = "0#{shifts[0]}"
  #   else
  #     key = shifts[0].to_s
  #   end
  #   length = key.length
  #
  #   require "pry"; binding.pry
  #
  #   next_val = shifts[1]
  #   while next_val < 100
  #
  #     if next_val < 10
  #       next_string = "0#{next_val}"
  #     else
  #       next_string = next_val.to_s
  #     end
  #
  #     if key[-1] == next_string[0]
  #       key = key + next_string[1]
  #       break
  #     else
  #       next_val += 27
  #     end
  #   end
  #
  #   if key.length == length
  #     shifts[0] += 27
  #     return Key.find_key(shifts)
  #   end
  #
  #   length = key.length
  #
  #   next_val = shifts[2]
  #
  #   while next_val < 100
  #
  #     if next_val < 10
  #       next_string = "0#{next_val}"
  #     else
  #       next_string = next_val.to_s
  #     end
  #
  #     if key[-1] == next_string[0]
  #       key = key + next_string[1]
  #       break
  #     else
  #       next_val += 27
  #     end
  #   end
  #
  #   if key.length == length
  #     shifts[0] += 27
  #     return Key.find_key(shifts)
  #   end
  #
  #   length = key.length
  #
  #   next_val = shifts[3]
  #   while next_val < 100
  #
  #     if next_val < 10
  #       next_string = "0#{next_val}"
  #     else
  #       next_string = next_val.to_s
  #     end
  #
  #     if key[-1] == next_string[0]
  #       key = key + next_string[1]
  #       break
  #     else
  #       next_val += 27
  #     end
  #   end
  #   require "pry"; binding.pry
  #
  #   if key.length == length || key.length > 5
  #     shifts[0] += 27
  #     return Key.find_key(shifts)
  #   end
  #
  #   key
  # end

  def self.find_key(shifts)
    key = 0
    moduli = []
    until moduli == shifts
      key_string = Key.normalize_length(key.to_s)
      keys = [key_string[0..1], key_string[1..2], key_string[2..3], key_string[3..4]]
      moduli = keys.map do |key|
        key.to_i % 27
      end
      key += 1
      if key > 99999
        return "This combo is longer than 5. Who cares what the key is at this point. You got the encrypted text my friend."
      end
    end
    key -= 1
    key = Key.normalize_length(key.to_s)
  end
end
