class Enigma

  attr_reader :alphabet,
              :key_a,
              :key_b,
              :key_c,
              :key_d

  def initialize
    @alphabet = ("a".."z").to_a << " "
    make_keys
    make_offsets
  end

  def make_keys
    keys = 5.times.map{rand(10)}.join.to_i.digits
    @key_a = keys[0]
    @key_b = keys[1]
    @key_c = keys[2]
    @key_d = keys[3]
  end

  def make_offsets

  end


end
