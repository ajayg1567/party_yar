class CreateSuperCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :super_categories do |t|
      t.string :name
      t.string :slug
      
      t.timestamps
    end
    add_index :super_categories, :slug, unique: true
  end
end
