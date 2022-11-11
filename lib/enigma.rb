class Enigma

  attr_reader :alphabet,
              :key_a,
              :key_b,
              :key_c,
              :key_d,
              :offset_a,
              :offset_b,
              :offset_c,
              :offset_d

  def initialize
    @alphabet = ("a".."z").to_a << " "
    make_keys
    make_offsets
  end

  def make_keys
    keys = 5.times.map{rand(10)}.join
    @key_a = keys[0..1].to_i
    @key_b = keys[1..2].to_i
    @key_c = keys[2..3].to_i
    @key_d = keys[3..4].to_i
  end

  def make_offsets

  end


end
