class AddTypeAndIdentityToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :card_type, :string
    add_column :cards, :identity, :string
    add_column :cards, :cmc, :integer
  end
end
