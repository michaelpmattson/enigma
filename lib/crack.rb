require_relative 'enigma'

encrypted_file = File.open(ARGV[0], "r")
encrypted = encrypted_file.read.strip

enigma = Enigma.new
cracked = enigma.crack(encrypted, ARGV[2])

cracked_file = File.open(ARGV[1], "w")

cracked_file.write(cracked[:decryption])
cracked_file.close

puts "Created '#{ARGV[1]}' with the key #{cracked[:key]} and date #{cracked[:date]}"
