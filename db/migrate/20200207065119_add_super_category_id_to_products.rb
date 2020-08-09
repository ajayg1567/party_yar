class AddSuperCategoryIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products,:super_category_id,:integer
  end
end
