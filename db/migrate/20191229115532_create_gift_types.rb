class CreateGiftTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :gift_types do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :gift_types, :slug, unique: true
  end
end
