class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :box_inventory, default: 0

      t.timestamps
    end
  end
end
