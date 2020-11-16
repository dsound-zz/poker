class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.integer :amount, default: 500 
      t.integer :player_id

      t.timestamps
    end
  end
end
