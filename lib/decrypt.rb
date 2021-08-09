require_relative 'enigma'

encrypted_file = File.open(ARGV[0], "r")
encrypted = encrypted_file.read
encrypted_file.close

enigma = Enigma.new
decrypted = enigma.decrypt(encrypted, ARGV[2], ARGV[3])

decrypted_file = File.open(ARGV[1], "w")

decrypted_file.write(decrypted[:decryption])
decrypted_file.close

puts "Created '#{ARGV[1]}' with the key #{decrypted[:key]} and date #{decrypted[:date]}"
