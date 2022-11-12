class Enigma

  attr_reader :alphabet,
              :keys,
              :offsets,
              :shifts

  def initialize
    @alphabet = ("a".."z").to_a << " "
    make_keys
    make_offsets
    make_shifts
  end

  def make_keys
    key_array = 5.times.map{rand(10)}.join
    @keys = {
      A: key_array[0..1].to_i,
      B: key_array[1..2].to_i,
      C: key_array[2..3].to_i,
      D: key_array[3..4].to_i
    }
  end

  def date_to_offsets
    time = Time.now
    date_num = [time.day, time.month, time.year.to_s[-2..-1].to_i].join.to_i**2
    offsets = date_num.to_s[-4..-1].to_i.digits
  end

  def make_offsets
    offset_array = date_to_offsets
    @offsets = {
      A: offset_array[0],
      B: offset_array[1],
      C: offset_array[2],
      D: offset_array[3]
    }
  end

  def make_shifts
    @shifts = {
      A: offsets[:A] + keys[:A],
      B: offsets[:B] + keys[:B],
      C: offsets[:C] + keys[:C],
      D: offsets[:D] + keys[:D]
    }
  end

  def shift(_char, _shift_val)
    char = _char.downcase
    shift_val = _shift_val % @alphabet.length
    if !@alphabet.any?(char)
      return char
    else
      org_alphabet = @alphabet.rotate(@alphabet.index(char))
      return org_alphabet[shift_val]
    end
  end
end
