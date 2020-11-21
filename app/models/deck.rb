class Deck 

  SUITS = [:spades, :diamonds, :hearts, :clubs]
  VALUES = (1..13).to_a
  FACES = ["Jack", "Queen", "King", "Ace"]

  attr_accessor :cards
  
  def initialize
    @cards = SUITS.flat_map do |suit|
      VALUES.map do |value| 
        Card.new(suit, value)
      end
    end
  end
  
  
  def shuffle
    @cards.shuffle!
  end
  
  def draw(amount)
    deck = self.shuffle
    deck.pop(amount)
  end
  
end
