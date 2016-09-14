class Poker
  attr_reader :hands
  CARD_VALUES = {'2' => 1, '3' => 2, '4' => 3, '5' => 4, '6' => 5, 
    '7' => 6, '8' => 7, '9' => 8, 'T' => 9, 'J' => 10, 'Q' => 11, 'K' => 12, 'A' => 13}
  HAND_CHECKS = [:straight_flush?, :square?, :full?, :flush?, :straight?, 
                    :three?, :two_pair?, :pair?, :high_card?]

  def initialize(hands)
    @hands = hands
  end

  def best_hand
    HAND_CHECKS.each do |sym|
      good_hands, card_comp = select_hands_of_type(sym)
      return pick_best_hand(good_hands, card_comp) unless good_hands.empty?
    end
  end

  def pick_best_hand(good_hands, high_card)
    good_hands.select { |hand| high_card.call(hand) == good_hands.map { |h| high_card.call(h) }.max }
  end

  def select_hands_of_type(sym)
    good_hands = hands.each_with_object([]) do |hand, arr|
      arr << hand if method(sym).call(hand)
    end

    [good_hands, top_card_block(sym)]
  end

  def top_card_block(sym)
    high_card_val = Proc.new { |hand| hand.map { |c| CARD_VALUES[c[0]] }.max }
    high_of_group = Proc.new do |hand|
      max_freq = max_freq(hand)
      hand.select { |card| hand.count { |c| c[0] == card[0] } == max_freq }.map { |c| CARD_VALUES[c[0]] }.max
    end

    return high_of_group if [:square?, :full?, :three?, :two_pair?, :pair?].include?(sym)
    high_card_val
  end

  def straight_flush?(hand)
    straight?(hand) && flush?(hand)
  end

  def square?(hand)
    max_freq(hand) == 4
  end

  def full?(hand)
    two_pair?(hand) && three?(hand)
  end

  def three?(hand)
    max_freq(hand) == 3
  end

  def straight?(hand)
    card_vals = hand.map { |card| CARD_VALUES[card[0]] }.sort
    return true if card_vals == [1, 2, 3, 4, 13] #the edgiest of cases
    first = card_vals[0]
    card_vals.map { |val| val - first } == [0, 1, 2, 3, 4]
  end

  def flush?(hand)
    hand.map { |card| hand.count { |c| c[1] == card[1] } }.max == 5
  end
  
  def two_pair?(hand)
    hand.select { |card| hand.count { |c| c[0] == card[0] } > 1 }.size > 3
  end

  def pair?(hand)
    max_freq(hand) == 2
  end

  def high_card?(hand)
    true
  end

  def max_freq(hand)
    hand.map { |card| hand.count { |c| c[0] == card[0] } }.max
  end
end