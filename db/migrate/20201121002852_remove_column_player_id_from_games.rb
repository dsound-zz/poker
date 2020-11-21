class RemoveColumnPlayerIdFromGames < ActiveRecord::Migration[6.0]
  def change 
    remove_column :games, :player_id
  end
end
