class AddShippingMethodIdsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products,:shipping_method_ids,:integer,array: true,default: []
  end
end
