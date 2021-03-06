class Card
  # class constants
  SUITS = %i(Clubs Hearts Spades Diamonds)
  PIPS  = %i(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

  # class variables (private)
  @@suit_value = SUITS.each_with_index.to_h
  @@pip_value = PIPS.each_with_index.to_h

  def initialize(pip, suit)
    @pip = pip
    @suit = suit
  end

  def pip
    @pip
  end

  def suit
    @suit
  end

  def to_s
    "#{@pip} #{@suit}"
  end

  # allow sorting an array of Cards: first by suit, then by
  # value
  def <=>(other)
    (@@suit_value[@suit] <=>
      @@suit_value[other.suit]).nonzero? or
    @@pip_value[@pip] <=> @@pip_value[other.pip]
  end
end

class Deck
  def initialize
    @deck = Card::SUITS.product(Card::PIPS).map { |suit, pip|
      Card.new(pip, suit)
    }
  end

  def to_s
    "[#{@deck.join(", ")}]"
  end

  def shuffle!
    @deck.shuffle!
    self
  end

  def deal(*args)
    @deck.shift(*args)
  end
end

deck = Deck.new.shuffle!
card = deck.deal
puts card.to_s
hand = deck.deal(5)
hand.each do |card|
  puts card.to_s
end
