class Enigma
  # modules

  # constants
  ALPHABET = ("a".."z").to_a << " "

  # readers / accessors

  # def initialize
  #
  # end
  #
  def encrypt(text, key = make_key, date = todays_date)
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
        encryption_array << shift_char(char, :a, shift_map) # a
      elsif index % 4 == 1
        encryption_array << shift_char(char, :b, shift_map) # b
      elsif index % 4 == 2
        encryption_array << shift_char(char, :c, shift_map) # c
      elsif index % 4 == 3
        encryption_array << shift_char(char, :d, shift_map) # d
      else
        # nothing, shouldn't get here.
      end
    end
    enc = encryption_array.join
  end

  def shift_char(char, key_letter, shift_map)
    return char if special_char?(char)
    shift = (ALPHABET.index(char) + shift_map[key_letter]) % 27
    ALPHABET[shift]
  end

  def special_char?(char)
    !ALPHABET.include?(char)
  end

  def decrypt(ciphertext, key, date = todays_date)
    {
      decryption: decryption(ciphertext, key, date),
      key: key,
      date: date
    }
  end

  def decryption(ciphertext, key, date)
    shift_map = shift_map(key, offset(date))
    text_array = ciphertext.chars
    decryption_array = []
    text_array.each_with_index do |char, index|
      if    index % 4 == 0
        decryption_array << unshift_char(char, :a, shift_map) # a
      elsif index % 4 == 1
        decryption_array << unshift_char(char, :b, shift_map) # b
      elsif index % 4 == 2
        decryption_array << unshift_char(char, :c, shift_map) # c
      elsif index % 4 == 3
        decryption_array << unshift_char(char, :d, shift_map) # d
      else
        # nothing, shouldn't get here.
      end
    end
    dec = decryption_array.join
  end

  def unshift_char(char, key_letter, shift_map)
    shift = (ALPHABET.index(char) - shift_map[key_letter]) % 27
    ALPHABET[shift]
  end

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
