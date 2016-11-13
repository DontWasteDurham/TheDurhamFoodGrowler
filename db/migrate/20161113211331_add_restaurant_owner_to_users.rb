class AddRestaurantOwnerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :restaurant_owner, :boolean, default: false
  end
end
