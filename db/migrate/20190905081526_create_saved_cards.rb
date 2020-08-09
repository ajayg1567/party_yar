class CreateSavedCards < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_cards do |t|
      t.string :card_number
      t.string :card_type
      t.integer :expiry_month
      t.integer :expiry_year
      t.string :card_holder_name
      t.integer :user_id

      t.timestamps
    end
  end
end
