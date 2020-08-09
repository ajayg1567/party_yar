class CreateShippingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_methods do |t|
      t.string :tag_name
      t.float :price

      t.timestamps
    end
  end
end
