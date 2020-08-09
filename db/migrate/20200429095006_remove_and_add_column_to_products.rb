class RemoveAndAddColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :shipping_method_id
    add_column :products, :shipping_method_id, :integer, array: true, default: []
  end
end
