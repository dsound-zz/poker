class HandsController < ApplicationController
 

  
    DECK = Deck.new 
    PLAYERS = [] 
    HANDS = []

    def deal
        2.times do |x|  
            HANDS << Hand.new(DECK.draw(5)) 
        end 
        render :json => HANDS
    end

    def index 
        render :json => HANDS
    end

    def beats
        game = Game.find(params[:game_id].to_i)
        players = Player.where(:id => game.id)
        byebug 
       if HANDS[0].beats?(HANDS[1])
        render :json => { player: players[0].username, hand: HANDS[0] }
       else 
        render :json => { player: players[1].username, hand: HANDS[1] }
       end
    end

    private 

    def shuffle
        @deck = Deck.new    
    end

   

end
