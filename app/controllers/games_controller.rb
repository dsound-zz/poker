class GamesController < ApplicationController
  before_action :find_game, only: [:show, :update, :delete]
  def home
  end

  def index
    @games = Game.all
    render :json => @games
  end

  def show
    render :json => @game 
  end

  def create
    @game = Game.create(game_params)
    if @game.save
      render :json => @game, status: @ok  
    else   
      render :json => { errors: @game.errors.full_messages }, status: @unprocessible_entity
    end 
  end

  def update
    @game = Game.update(game_params)
    if @game.save 
      render :json => @game, status: @ok 
    else  
      render :json => { errors: @game.errors.full_messages }, status: @unprocessible_entity
    end
  end

  def destroy
     if @game.delete  
        render :json => "Game deleted" 
     else   
        render :json => "Unable to delete"
     end

  end

  private 

  def find_game
    @game = Game.find(params[:id]) 
  end

  def game_params
    params.permit(:name, :player_count, :player_id, :id) 
  end
end
