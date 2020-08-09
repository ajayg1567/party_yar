class AddNewFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :role_id, :integer
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :date_of_anniversary, :date
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :token, :string
    add_column :users, :expires_at, :integer
    add_column :users, :expires, :boolean
    add_column :users, :refresh_token, :string
  end
end
