class Trinary
  def initialize(s)
    @s = s
  end

  def to_decimal
    str = @s.reverse
    num = 0
    str.chars.each_with_index do |d, x|
      digit = d.to_i
      return 0 unless digit.to_s == d && digit < 3
      num += digit * (3**x)
    end

    num
  end
end
