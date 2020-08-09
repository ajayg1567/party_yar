class CreateTimeSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :time_slots do |t|
      t.time :from
      t.time :to
      t.integer :shipping_method_id

      t.timestamps
    end
  end
end
