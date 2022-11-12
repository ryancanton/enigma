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
    make_shifts
  end

  def make_keys
    keys = 5.times.map{rand(10)}.join
    @key_a = keys[0..1].to_i
    @key_b = keys[1..2].to_i
    @key_c = keys[2..3].to_i
    @key_d = keys[3..4].to_i
  end

  def date_to_offsets
    time = Time.now
    date_num = [time.day, time.month, time.year.to_s[-2..-1].to_i].join.to_i**2
    offsets = date_num.to_s[-4..-1].to_i.digits
  end

  def make_offsets
    offsets = date_to_offsets
    @offset_a = offsets[0]
    @offset_b = offsets[1]
    @offset_c = offsets[2]
    @offset_d = offsets[3]
  end

  def make_shifts
    @shifts = {
      A: offset_a + key_a,
      B: offset_b + key_b,
      C: offset_c + key_c,
      D: offset_d + key_d
    }
  end
end
