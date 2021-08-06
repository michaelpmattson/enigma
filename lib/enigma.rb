class Enigma
  # modules

  # constants
  ALPHABET = ("a".."z").to_a << " "

  # readers / accessors

  # def initialize
  #
  # end
  #
  def encrypt(text, key, date = todays_date)
    {
      encryption: encryption(text, key, date),
      key: key,
      date: date
    }
  end

  def encryption(text, key, date)
    shift_map = shift_map(key, offset(date))
    text_array = text.chars
    encryption_array = []
    text_array.each_with_index do |char, index|
      if    index % 4 == 0
        encryption_array << shift_char(char, :a) # a
      elsif index % 4 == 1
        encryption_array << shift_char(char, :b) # b
      elsif index % 4 == 2
        encryption_array << shift_char(char, :c) # c
      elsif index % 4 == 3
        encryption_array << shift_char(char, :d) # d
      else
        # nothing, shouldn't get here.
      end
    end
    encryption_array.join
  end

  def shift_char(char, key_letter)
    map = shift_map() # store this somewhere!!!!
    ALPHA.index(char) + shift_map
  end
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
