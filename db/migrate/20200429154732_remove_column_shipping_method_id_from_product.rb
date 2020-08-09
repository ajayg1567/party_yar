class RemoveColumnShippingMethodIdFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products,:shipping_method_id
  end
end
