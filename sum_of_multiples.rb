class SumOfMultiples
  attr_accessor :nums

  def self.to(n)
    (1...n).select { |i| [3,5].any? { |k| i % k == 0 } }.reduce(0,:+)
  end

  def initialize(*numbers)
    @nums = numbers ? numbers : [3,5] #not sure how to default assign splat parameter
  end

  def to(n)
    (1...n).select { |i| nums.any? { |k| i % k == 0 } }.reduce(0,:+)
  end
end