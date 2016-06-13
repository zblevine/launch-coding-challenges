class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    wc = {}
    words = @phrase.split(/[\W\s&&[^\']]/)
    words.select {|word| word.size > 0 }.each do |word|
      normalize(word)
      wc[word] = wc[word] ? wc[word] + 1 : 1
    end

    wc
  end

  def normalize(word)
    word.slice!(0) if word.start_with?("'")
    word.chop! if word.end_with?("'")
    word.downcase!
  end
end
