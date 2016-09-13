class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.integer :number_of_boxes, default: 0
      t.boolean :returned, default: false
      t.boolean :taken, default: false

      t.timestamps
    end
  end
end
