class CreateOccasions < ActiveRecord::Migration[5.2]
  def change
    create_table :occasions do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
    add_index :occasions, :slug, unique: true
  end
end
