class AddPaymentToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :payment, :integer
  end
end
