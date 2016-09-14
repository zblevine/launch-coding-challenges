class PerfectNumber
  def self.classify(num)
    if num.to_i != num || num.to_i < 2
      raise RuntimeError, 'Number must be an integer greater than 1'
    end

    sum_of_factors = self.factors(num).reduce(:+)
    if sum_of_factors == num
      'perfect'
    elsif sum_of_factors < num
      'deficient'
    else
      'abundant'
    end
  end

  def self.factors(num)
    top_factor = Math.sqrt(num).floor
    factors = (2..top_factor).each_with_object([]) do |i, arr|
      if num % i == 0
        arr << i
        arr << num / i
      end
    end

    factors.pop if top_factor ** 2 == num
    factors << 1
  end
end