class CreateExtraFields < ActiveRecord::Migration[5.2]
  def change
    create_table :extra_fields do |t|
      t.string :option_type
      t.string :option_value
      t.integer :product_id

      t.timestamps
    end
  end
end
