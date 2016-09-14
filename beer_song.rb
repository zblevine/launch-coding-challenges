class BeerSong
  attr_reader :verse_list

  def initialize
    @verse_list = [NoMoreVerse.new, OneMoreVerse.new, TwoMoreVerse.new]
    (3..99).each { |n| @verse_list << Verse.new(n) }
  end

  def verse(idx)
    verse_list[idx].text
  end

  def verses(start, fin)
    (fin..start).to_a.reverse.map { |idx| verse(idx) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

class Verse
  attr_reader :text

  def initialize(n)
    @text = "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
      "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
  end
end

class TwoMoreVerse < Verse
  def initialize
    @text = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end
end

class OneMoreVerse < Verse
  def initialize
    @text = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
end

class NoMoreVerse < Verse
  def initialize
    @text = "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end