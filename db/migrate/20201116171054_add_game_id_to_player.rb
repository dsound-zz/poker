class AddGameIdToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :game_id, :integer
  end
end
