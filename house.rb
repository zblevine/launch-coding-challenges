class House

  def self.recite
    new.recite_full
  end

  def recite_full
    recite(pieces.size)
  end

  private

  def recite(n)
    return "This is " + pieces.last[0] + ".\n" if n == 1
    so_far = recite(n-1)
    so_far + "\n" + "This is " + pieces[-1*n].join("\n") + so_far.split("This is").last
  end

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end