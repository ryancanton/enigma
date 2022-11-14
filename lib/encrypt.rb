require_relative 'enigma'

handle = File.open(ARGV[0], "r")
message = handle.read
handle.close

enigma = Enigma.new

cipher_hash = enigma.encrypt(message)
cipher_text = cipher_hash[:encryption]
cipher_key = cipher_hash[:key]
cipher_date = cipher_hash[:date]

writer = File.open(ARGV[1], "w")
writer.write(cipher_text)
writer.close

puts "Created 'encrypted.txt' with the key #{cipher_key} and date #{cipher_date}"
