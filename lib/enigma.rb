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

  def make_keys(key_array = nil)
    if key_array == nil
      key_array = 5.times.map{rand(10)}.join
    end
    @keys = {
      A: key_array[0..1].to_i,
      B: key_array[1..2].to_i,
      C: key_array[2..3].to_i,
      D: key_array[3..4].to_i,
      key: key_array
    }
  end

  def date_to_offsets(date_num = nil)
    if date_num == nil
      time = Time.now
      date_num = [time.day, time.month, time.year.to_s[-2..-1].to_i].join
    end
    date_num_sqrd = date_num.to_i**2
    offsets = date_num_sqrd.to_s[-4..-1].to_i.digits.reverse
    offsets << date_num
  end

  def make_offsets(date_num = nil)
    offset_array = date_to_offsets(date_num)
    @offsets = {
      A: offset_array[0],
      B: offset_array[1],
      C: offset_array[2],
      D: offset_array[3],
      date: offset_array[4]
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

  def reassign_key_and_offsets(key, date)
    if (key != nil && date != nil)
      make_keys(key)
      make_offsets(date)
      make_shifts
    end
  end

  def shift_message(message, crypt_val)
    cipher = []
    shift_val = 1
    message.each do |char|
      case shift_val
      when 1
        cipher.push(shift(char, shifts[:A] * crypt_val))
      when 2
        cipher.push(shift(char, shifts[:B] * crypt_val))
      when 3
        cipher.push(shift(char, shifts[:C] * crypt_val))
      when 4
        cipher.push(shift(char, shifts[:D] * crypt_val))
      end
      if shift_val == 4
        shift_val = 1
      else
        shift_val += 1
      end
    end
    cipher.join
  end

  def encrypt(message, key = nil, date = nil)
    reassign_key_and_offsets(key, date)
    cipher = shift_message(message.split(''), 1)
    hash = {
      encryption: cipher,
      key:        @keys[:key],
      date:       @offsets[:date]
    }
  end

  def decrypt(cipher, key = nil, date = nil)
    reassign_key_and_offsets(key, date)
    message = shift_message(cipher.split(''), -1)
    hash = {
      decryption: message,
      key:        @keys[:key],
      date:       @offsets[:date]
    }
  end

end
