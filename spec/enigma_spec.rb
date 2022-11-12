require './lib/enigma'

RSpec.describe Enigma do
  describe '#initialize and helper methods called inside of initialize' do
    it 'exists' do
      enigma = Enigma.new

      expect(enigma).to be_a(Enigma)
    end

    it 'has alphabet' do
      enigma = Enigma.new

      expect(enigma.alphabet).to be_a(Array)
      expect(enigma.alphabet).to eq(("a".."z").to_a << " ")
    end

    it 'has keys (#make_keys)' do
      enigma = Enigma.new

      expect(enigma.keys[:A]).to be_a(Integer)
      expect(enigma.keys[:A].digits.length).to be <(3)
      expect(enigma.keys[:B]).to be_a(Integer)
      expect(enigma.keys[:B].digits.length).to be <(3)
      expect(enigma.keys[:C]).to be_a(Integer)
      expect(enigma.keys[:C].digits.length).to be <(3)
      expect(enigma.keys[:D]).to be_a(Integer)
      expect(enigma.keys[:D].digits.length).to be <(3)
    end

    it 'has offsets (#make_offsets and #date_to_offsets)' do
      enigma = Enigma.new

      expect(enigma.offsets[:A]).to be_a(Integer)
      expect(enigma.offsets[:A].digits.length).to eq(1)
      expect(enigma.offsets[:B]).to be_a(Integer)
      expect(enigma.offsets[:B].digits.length).to eq(1)
      expect(enigma.offsets[:C]).to be_a(Integer)
      expect(enigma.offsets[:C].digits.length).to eq(1)
      expect(enigma.offsets[:D]).to be_a(Integer)
      expect(enigma.offsets[:D].digits.length).to eq(1)
    end

    it 'has shifts (#make_shifts)' do
      enigma = Enigma.new

      expect(enigma.shifts[:A]).to be_a(Integer)
      expect(enigma.shifts[:A]).to eq(enigma.offsets[:A] + enigma.keys[:A])
      expect(enigma.shifts[:B]).to be_a(Integer)
      expect(enigma.shifts[:B]).to eq(enigma.offsets[:B] + enigma.keys[:B])
      expect(enigma.shifts[:C]).to be_a(Integer)
      expect(enigma.shifts[:C]).to eq(enigma.offsets[:C] + enigma.keys[:C])
      expect(enigma.shifts[:D]).to be_a(Integer)
      expect(enigma.shifts[:D]).to eq(enigma.offsets[:D] + enigma.keys[:D])
    end
  end

  describe '#make_keys' do
    it 'can take an argument to set the keys manually' do
      enigma = Enigma.new
      enigma.make_keys("12345")

      expect(enigma.keys[:A]).to eq(12)
      expect(enigma.keys[:B]).to eq(23)
      expect(enigma.keys[:C]).to eq(34)
      expect(enigma.keys[:D]).to eq(45)
    end
  end

  describe '#make_offsets' do
    it 'can take an argument to set the offsets manually' do
      enigma = Enigma.new
      enigma.make_offsets("170624")

      expect(enigma.offsets[:A]).to eq(9)
      expect(enigma.offsets[:B]).to eq(3)
      expect(enigma.offsets[:C]).to eq(7)
      expect(enigma.offsets[:D]).to eq(6)
    end
  end

  describe '#shift' do
    it 'correctly shifts a character in an alphabet by a given value' do
      enigma = Enigma.new

      expect(enigma.shift('a', 0)).to eq('a')
      expect(enigma.shift('a', 27)).to eq('a')
      expect(enigma.shift('!', 34)).to eq('!')
      expect(enigma.shift('L', 73)).to eq('d')
      expect(enigma.shift(' ', 4)).to eq('d')
      expect(enigma.shift('d', -73)).to eq('l')
      expect(enigma.shift('K', -4)).to eq('g')
    end
  end

  describe 'shift_message' do
    it 'returns a shifted string based on key and offset values' do
      enigma = Enigma.new
      enigma.make_keys("02715")
      enigma.make_offsets("040895")
      enigma.make_shifts

      expect(enigma.shift_message("Hello world!".split(""), 1)).to eq("keder ohulw!")
    end
  end

  describe '#encrypt' do
    it 'returns an encrypted message with a given key and date' do
      enigma = Enigma.new

      expect(enigma.encrypt("Hello World!", "02715", "040895")).to eq({
                                                               encryption: "keder ohulw!",
                                                               key: "02715",
                                                               date: "040895"
                                                             })
    end
  end

  describe '#decrypt' do
    it 'returns a decoded message with a given key and date' do
      enigma = Enigma.new

      expect(enigma.decrypt("keder ohulw!", "02715", "040895")).to eq({
                                                               decryption: "hello world!",
                                                               key: "02715",
                                                               date: "040895"
                                                             })
    end
  end

  describe '#encrypt and #decrypt' do
    it 'successfully encrypts and decrypts messages when give no keys or dates' do
      enigma = Enigma.new
      original_message = "hello world"
      encrypted_message = enigma.encrypt(original_message)[:encryption]
      decrypted_message = enigma.decrypt(encrypted_message)[:decryption]

      expect(decrypted_message).to eq(original_message)
      expect(encrypted_message.length).to eq(original_message.length)
    end
  end
end
