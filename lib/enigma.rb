class Enigma
  # modules

  # constants
  ALPHABET = ("a".."z").to_a << " "

  # readers / accessors

  # def initialize
  #
  # end
  #
  # def encrypt(text, key, date: todays_date)
  #
  # end
  #
  # def decrypt(ciphertext, key, date: todays_date)
  #
  # end
  #
  # def crack(ciphertext, date: todays_date)
  #
  # end

  def make_key
    normalize_length(random_string_num)
  end

  def random_string_num
    rand(100000).to_s
  end

  def normalize_length(string_num)
    while string_num.length < 5
      string_num = "0" + string_num
    end
    string_num
  end

  def todays_date
    Date.today.strftime("%d%m%y")
  end

  def offset(date)
    date = date.to_i
    squared = date * date
    squared.to_s.slice(-4, 4)
  end

  def key_map(key)
    {
      a: key[0..1].to_i,
      b: key[1..2].to_i,
      c: key[2..3].to_i,
      d: key[3..4].to_i
    }
  end

  def shift_map(key, offset)
    {
      a: key_map(key)[:a] + offset[0].to_i,
      b: key_map(key)[:b] + offset[1].to_i,
      c: key_map(key)[:c] + offset[2].to_i,
      d: key_map(key)[:d] + offset[3].to_i
    }
  end
end
