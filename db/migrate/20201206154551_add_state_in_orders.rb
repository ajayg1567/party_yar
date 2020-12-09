class AddStateInOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :state, :integer, default: 0
  end
end
