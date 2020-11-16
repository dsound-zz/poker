class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :username, default: Faker::Ancient.god 
      t.boolean :is_dealer

      t.timestamps
    end
  end
end
