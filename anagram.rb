class Anagram
  attr_reader :word, :letters

  def initialize(word)
    @word = word.downcase
    @letters = @word.chars.sort
  end

  def sorted_letters(str)
    str.downcase.chars.sort 
    #yeah I could have just put this in my select block, but this looks nicer
  end

  def match(word_array)
    word_array.select { |ana| sorted_letters(ana) == letters && ana.downcase != word }
  end
end