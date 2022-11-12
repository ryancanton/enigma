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

      expect(enigma.keys[:A]).to be_a(Integer)
      expect(enigma.keys[:A].digits.length).to be <(3)
      expect(enigma.keys[:B]).to be_a(Integer)
      expect(enigma.keys[:B].digits.length).to be <(3)
      expect(enigma.keys[:C]).to be_a(Integer)
      expect(enigma.keys[:C].digits.length).to be <(3)
      expect(enigma.keys[:D]).to be_a(Integer)
      expect(enigma.keys[:D].digits.length).to be <(3)
    end

    it 'has offsets' do
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
  end
end
