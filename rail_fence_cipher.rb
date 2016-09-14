class RailFenceCipher
  def self.encode(str, n)
    return str if n > str.length || n == 1

    rails = [''] * n
    str.chars.each_with_index do |c, idx|
      r = self.get_rail(n, idx)
      rails[r] += c
    end

    rails.join
  end

  def self.decode(str, n)
    return str if n > str.length || n == 1

    mod = 2*n - 2
    decoded = ' '*str.length

    rails = self.split_rails(str, n)
    curr_idx = 0
    rails[0].chars.each do |c|
      decoded[curr_idx] = c
      curr_idx += mod
    end

    curr_idx = mod / 2
    rails[n - 1].chars.each do |c|
      decoded[curr_idx] = c
      curr_idx += mod
    end

    (1...n-1).each do |r|
      curr_1 = r
      curr_2 = mod - r
      rails[r].chars.each_slice(2) do |a|
        decoded[curr_1] = a[0]
        a[1] && (decoded[curr_2] = a[1])
        curr_1 += mod
        curr_2 += mod
      end
    end

    decoded
  end

  def self.get_rail(n, idx)
    mod = 2*n - 2
    rem = idx % mod

    case rem
    when 0
      0
    when mod / 2
      n - 1
    else
      ((rem < mod / 2) && rem) || mod - rem
    end
  end

  def self.split_rails(str, n)
    mod = 2*n - 2
    len = str.length

    lengths = self.rail_lengths(len, n)
    pos = 0
    (0...n).map do |idx|
      curr_pos = pos
      pos += lengths[idx]
      str[curr_pos, lengths[idx]]
    end
  end

  def self.rail_lengths(len, n)
    mod = 2*n - 2
    remainder = len % mod
    lengths = [len / mod]
    lengths[n-1] = len / mod;
    (1...n-1).each { |idx| lengths[idx] = 2*(len / mod) }

    (0...mod/2).each do |idx|
      break unless remainder > idx
      lengths[idx] += 1
    end

    (mod/2...mod).each do |idx|
      break unless remainder > idx
      lengths[mod - idx] += 1
    end

    lengths
  end
end