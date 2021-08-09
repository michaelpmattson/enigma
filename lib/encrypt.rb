require_relative 'enigma'

message_file = File.open(ARGV[0], "r")
message = message_file.read
message_file.close

enigma = Enigma.new
encrypted = enigma.encrypt(message)

encrypted_file = File.open(ARGV[1], "w")

encrypted_file.write(encrypted[:encryption])
encrypted_file.close

puts "Created '#{ARGV[1]}' with the key #{encrypted[:key]} and date #{encrypted[:date]}"
