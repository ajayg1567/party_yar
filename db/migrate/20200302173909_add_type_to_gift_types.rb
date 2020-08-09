class AddTypeToGiftTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :gift_types,:type,:string
  end
end
