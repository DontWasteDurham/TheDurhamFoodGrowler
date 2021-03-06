class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :business_account, :boolean, default: false
    add_column :users, :purchased_boxes, :integer, default: 0
    add_column :users, :box_status, :integer, default: 0
    add_column :users, :exp_date, :date
  end
end
