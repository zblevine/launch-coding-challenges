class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    @strand.chars.select.with_index do |char, idx|
      other_strand.chars[idx] && other_strand.chars[idx] != char
    end.count
  end
end