require_relative 'enigma'

handle = File.open(ARGV[0], "r")
cipher_text = handle.read
handle.close

key = ARGV[2].to_s
date = ARGV[3].to_s
enigma = Enigma.new

decrypt_hash = enigma.decrypt(cipher_text, key, date)
decrypted_text = decrypt_hash[:decryption]
decrypt_key = decrypt_hash[:key]
decrypt_date = decrypt_hash[:date]

writer = File.open(ARGV[1], "w")
writer.write(decrypted_text)
writer.close

puts "Created 'decrypted.txt' with the key #{key} and date #{date}"
