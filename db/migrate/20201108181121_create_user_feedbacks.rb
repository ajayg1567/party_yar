class CreateUserFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_feedbacks do |t|
      t.integer :rating
      t.string :comment
      t.integer :product_id
      t.string :user_id

      t.timestamps
    end
  end
end
