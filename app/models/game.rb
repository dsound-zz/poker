class Game < ApplicationRecord

    has_many :player_games 
    has_many :games, through: :palyer_games



    def deal
        player_name = nil
        player_count = self.player_count 
        player_count.times do |pc|
             byebug
        end
    end

    private 

    def player_hands 
        deck = Deck.new  
        Hand.new(deck.cards.sample(5)) 
    end
    
end
