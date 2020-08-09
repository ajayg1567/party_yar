class AddOccasionIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :occasion_id, :integer
  end
end
