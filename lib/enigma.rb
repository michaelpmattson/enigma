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

  def key_gen
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
end
