class RemoveColumnFromProducnew < ActiveRecord::Migration[5.2]
  def up
    remove_column :products, :shipping_price
  end

  def down
    add_column :products, :shipping_price, :integer
  end
end
