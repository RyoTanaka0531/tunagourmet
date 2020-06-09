class AddProducerIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :producer_id, :integer
  end
end
