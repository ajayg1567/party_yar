class AddColumnProductionVariationId < ActiveRecord::Migration[5.2]
  def change
  	add_column :items, :product_variation_id, :integer
  	add_column :orders, :product_variation_id, :integer
  end
end
