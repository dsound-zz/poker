class Hand 

	

	attr_accessor :cards, :player_id, :id

	def initialize(*cards, player_id)
		@cards = cards.flatten
		@player_id = player_id
  	end
  
  	
end
