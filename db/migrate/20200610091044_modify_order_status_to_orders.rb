class ModifyOrderStatusToOrders < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :order_status, :integer, null: false, default: 0
  end
  def down
    change_column :orders, :order_status, :boolean, null: false, default: false
  end
end
