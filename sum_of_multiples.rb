class SumOfMultiples
  attr_reader :nums

  def self.to(n)
    new.to(n)
  end

  def initialize(*numbers)
    @nums = numbers.empty? ? [3,5] : numbers #not sure how to default assign splat parameter
  end

  def to(n)
    (1...n).select { |i| nums.any? { |k| i % k == 0 } }.reduce(0,:+)
  end
end