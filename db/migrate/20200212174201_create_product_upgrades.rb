class CreateProductUpgrades < ActiveRecord::Migration[5.2]
  def change
    create_table :product_upgrades do |t|
      t.integer :quantity
      t.string :size
      t.integer :price
      t.integer :product_id

      t.timestamps
    end
  end
end
