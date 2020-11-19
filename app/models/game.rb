class Game < ApplicationRecord

    has_many :player_games 
    has_many :games, through: :player_games



    def deal_hand(player_id)
        
    end

    def beats?(other)
   		score > other.score
  	end

  def score
	unit = 1000
	total = 0
	total += unit * 10 if is_straight && is_flush
	total += unit * 8 if of_a_kind == 4
	total += unit * 7 if is_full_house
	total += unit * 6 if is_flush
	total += unit * 5 if is_straight
	total += unit * 4 if !is_full_house && of_a_kind == 3
	total += unit * 3 if is_two_pair
	total += unit * 2 if !is_two_pair && of_a_kind == 2
	if total >= 2000
	  total += total_value
	end
	total += high_card.value
	total
  end

  def is_full_house
	values = @cards.group_by(&:value).values
	values.length == 2 && values.all? {|v| [2,3].include? v}
  end

  def is_flush
	by_value = @cards.sort_by(&:value).map(&:suit).uniq.length == 1
  end

  def is_straight
	last_card = nil
	differences = []
	@cards.sort_by(&:value).each do |card| 
	  if last_card
		differences.push(card.value - last_card.value)
	  end
	  last_card = card
	end
	differences.uniq.length == 1 && differences.first == 1
  end


  def is_two_pair
	values = @cards.group_by(&:value).values.sort_by(&:length)
	values.length == 3 && values.last.length == 2
  end
  
  def of_a_kind
	pairs_up = @cards.group_by(&:value).values.sort_by(&:length).filter{|g| g.length > 1}
	pairs_up.last && pairs_up.last.length
  end
  
  def total_value
	@cards.map(&:value).reduce(:+)
  end
  
  def high_card
	@cards.sort_by(&:value).last
  end

    private 

    def player_hand 
        deck = Deck.new  
        Hand.new(deck.cards.sample(5)) 
    end
    
end
