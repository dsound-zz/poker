class Games < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t| 
      t.string :name, default: Faker::Ancient.hero 
      t.integer :player_count, default: 2
      t.timestamps  
    end 
  end
end
