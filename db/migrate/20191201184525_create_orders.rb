class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :user_id
      t.string :order_id
      t.string :payment_mode
      t.integer :price
      t.string :status
      t.integer :product_id
      t.string :payment_id
      t.string :order_no
      t.text :additional
      
      t.timestamps
    end
  end
end
