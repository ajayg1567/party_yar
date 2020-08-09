class AddItemIdToAddress < ActiveRecord::Migration[5.2]
  def change
      add_column :addresses, :item_id, :integer
  end
end
