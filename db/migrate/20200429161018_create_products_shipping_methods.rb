class CreateProductsShippingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :products_shipping_methods, id: false do |t|
      t.belongs_to :shipping_method, index: true
      t.belongs_to :product, index: true
    end
  end
end
