class AddDescriptionToSuperCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :super_categories,:description,:text
  end
end
