class AddProductIdToOders < ActiveRecord::Migration[5.2]
  def change
    add_column :oders, :product_id, :integer
  end
end
