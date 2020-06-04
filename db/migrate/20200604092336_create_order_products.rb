class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :postage
      t.integer :count
      t.integer :order_id
      t.integer :product_id

      t.timestamps
    end
  end
end
