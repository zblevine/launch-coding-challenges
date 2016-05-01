class Triangle
  attr_reader :rows

  def initialize(n)
    @rows = [[1]]
    (1...n).each do |i|
      prev = @rows.last
      row = []
      (0...i-1).each do |j|
        row << prev[j] + prev[j+1]
      end

      row.unshift(1) << 1
      @rows << row
    end
  end
end