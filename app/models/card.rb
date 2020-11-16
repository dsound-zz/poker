class Card
    attr_accessor :suit, :value
  
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
  
  def to_s
    suit = @suit.to_s.capitalize
    if @value >= 0 && @value < 10
      "#{@value + 1} of #{suit}"
    else
      "#{FACES[@value - 10]} of #{suit}"
    end
  end
end


