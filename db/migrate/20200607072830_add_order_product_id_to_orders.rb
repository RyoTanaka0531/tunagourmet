class AddOrderProductIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :order_product_id, :integer
  end
end
