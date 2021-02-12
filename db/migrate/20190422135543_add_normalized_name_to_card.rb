class AddNormalizedNameToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :normalized_name, :string, index: true
  end
end
