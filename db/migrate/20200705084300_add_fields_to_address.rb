class AddFieldsToAddress < ActiveRecord::Migration[5.2]
  def change
      add_column :addresses, :mobile,  :string
      add_column :addresses, :alt_mobile, :string
      add_column :addresses, :landmark, :string 
      add_column :addresses, :email, :string
  end
end
