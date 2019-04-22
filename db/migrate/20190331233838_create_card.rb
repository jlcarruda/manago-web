class CreateCard < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :uuid
      t.string :uri
      t.string :scryfall_uri
      t.string :image_url
      t.json :object
    end
  end
end
