class AddWeight < ActiveRecord::Migration[5.2]
  def change
  	remove_column :variations, :size, :string
  	add_column :variations, :unit, :string
  	add_column :variations, :has_variation, :boolean, default: false
  end
end
