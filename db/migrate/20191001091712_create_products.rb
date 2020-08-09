class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :shipping_method_id
      t.integer :sub_category_id
      t.boolean :has_variations, null: false, default: :false
      t.integer :quantity
      t.string :slug
      t.string :city
      t.boolean :active, null: false, default: false

      t.timestamps
    end
    add_index :products, :slug, unique: true
  end
end
