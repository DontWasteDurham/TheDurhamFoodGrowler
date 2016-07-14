class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :admin, :boolean
    add_column :users, :business_account, :boolean
    add_column :users, :purchased_boxes, :integer
    add_column :users, :box_status, :integer
    add_column :users, :exp_date, :date
  end
end
