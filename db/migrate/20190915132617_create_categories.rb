class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.references :super_category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :categories, :slug, unique: true
  end
end
