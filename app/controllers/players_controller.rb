class PlayersController < ApplicationController

  before_action :find_player, only: [:show, :update, :delete]
  

  def index
    @players = Player.all
    render :json => @players 
  end

 def show 
    render :json => @player
 end

  def create
    @player = Player.create(player_params)
    if @player.save
        Bank.create(player_id: Plyaer.last.id)
      render :json => @player, status: @ok  
    else   
      render :json => { errors: @player.errors.full_messages }, status: @unprocessible_entity
    end 
  end

  def update
    @player = Player.update(player_params)
    if @player.save 
      render :json => @player, status: @ok 
    else  
      render :json => { errors: @player.errors.full_messages }, status: @unprocessible_entity
    end
  end

  def destroy
     if @player.delete 
        render :json => "player deleted" 
     else   
        render :json => "Unable to delete"
     end

  end

  private 

  def find_player
    @player = Player.find(params[:id]) 
  end

  def player_params
    params.permit(:username, :is_dealer, :bank_id, :id)
  end
end


