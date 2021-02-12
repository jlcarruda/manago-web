class CreateDeckCards < ActiveRecord::Migration[5.2]
  def change
    create_table :deck_cards do |t|
    	t.belongs_to :cards, index: true
    	t.belongs_to :decks, index: true
    	t.timestamps
    end
  end
end
