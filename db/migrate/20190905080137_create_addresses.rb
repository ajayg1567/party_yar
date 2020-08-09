class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :pincode

      t.timestamps
    end
  end
end
