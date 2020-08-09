class CreateAddOns < ActiveRecord::Migration[5.2]
  def change
    create_table :add_ons do |t|
      t.string :name
      t.float :price
      t.integer :category_id
      t.integer :sub_category_id

      t.timestamps
    end
  end
end
