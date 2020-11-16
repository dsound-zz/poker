

# SUITS = [:spades, :diamonds, :hearts, :clubs]
# VALUES = (1..13).to_a
# FACES = ["Jack", "Queen", "King", "Ace"]

# VALUES.flat_map do |v| 
#     SUITS.map do |s| 
#         Card.new(:value => v, :suit => s)
#     end
# end

demian = Player.create(:username => "Demian", is_dealer: true)

