require_relative 'enigma'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new
encrypted = enigma.encrypt(message, "02715", "040895")

encrypted_file = File.open(ARGV[1], "w")

encrypted_file.write(encrypted[:encryption])
encrypted_file.close

puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
