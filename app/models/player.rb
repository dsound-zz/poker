class Player < ApplicationRecord

    belongs_to :game
    has_one :bank_account, dependent: :destroy

end
