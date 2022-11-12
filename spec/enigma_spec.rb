require './lib/enigma'

RSpec.describe Enigma do
  describe '#initialize and methods called inside of initialize' do
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
end
