require './lib/enigma'

RSpec.describe Enigma do
  describe '#initialize' do
    it 'exists' do
      enigma = Enigma.new

      expect(enigma).to be_a(Enigma)
    end

    it 'has alphabet' do
      enigma = Enigma.new

      expect(enigma.alphabet).to be_a(Array)
      expect(enigma.alphabet).to eq(("a".."z").to_a << " ")
    end

    it 'has keys' do
      enigma = Enigma.new

      expect(enigma.key_a).to be_a(Integer)
      expect(enigma.key_a.digits.length).to eq(1)
      expect(enigma.key_b).to be_a(Integer)
      expect(enigma.key_b.digits.length).to eq(1)
      expect(enigma.key_c).to be_a(Integer)
      expect(enigma.key_c.digits.length).to eq(1)
      expect(enigma.key_d).to be_a(Integer)
      expect(enigma.key_d.digits.length).to eq(1)
    end
  end
end
