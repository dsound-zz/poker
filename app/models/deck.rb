class Deck 

  SUITS = [:spades, :diamonds, :hearts, :clubs]
  VALUES = (1..13).to_a
  FACES = ["Jack", "Queen", "King", "Ace"]

  attr_reader :cards
  
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
    @cards.pop(amount)
  end
  
end
