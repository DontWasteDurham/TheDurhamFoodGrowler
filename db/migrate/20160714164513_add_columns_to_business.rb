class AddColumnsToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :name, :string
    add_column :businesses, :exp_date, :date
    add_column :businesses, :boxes_checked_in, :integer
    add_column :businesses, :boxes_checked_out, :integer
    add_column :businesses, :boxes_supplied, :integer
    add_column :businesses, :boxes_inventory, :integer
  end
end
