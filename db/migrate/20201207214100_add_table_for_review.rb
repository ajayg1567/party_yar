class AddTableForReview < ActiveRecord::Migration[5.2]
  def change
  	create_table :reviews do |t|
      	t.integer :stars
      	t.text :content
      	t.references :user, null: false, foreign_key: true
      	t.references :product, null: false, foreign_key: true
      	
      	t.timestamps
    end
  end
end
