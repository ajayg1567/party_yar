class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :sub_categories, :slug, unique: true
  end
end
