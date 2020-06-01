class CreateOders < ActiveRecord::Migration[5.2]
  def change
    create_table :oders do |t|
      t.integer :count, null: false
      t.integer :payment, null: false
      t.text :remark
      t.boolean :order_status, null: false, default: 0
      t.integer :buyer_id, null: false

      t.timestamps
    end
  end
end
