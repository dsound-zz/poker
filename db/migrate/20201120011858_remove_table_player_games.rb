class RemoveTablePlayerGames < ActiveRecord::Migration[6.0]
  def change
    drop_table :player_games
  end
end
