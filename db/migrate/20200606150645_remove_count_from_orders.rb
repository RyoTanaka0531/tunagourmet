class RemoveCountFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :count, :integer
    remove_column :orders, :payment, :integer
  end
end
