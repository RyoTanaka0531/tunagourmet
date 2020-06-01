class ModifyProducerIdBuyerIdToPosts < ActiveRecord::Migration[5.2]
  def up
    change_column :posts, :buyer_id, :integer, null: true
    change_column :posts, :producer_id, :integer, null: true
  end
  def down
    change_column :posts, :buyer_id, :integer, null: false
    change_column :posts, :producer_id, :integer, null: false
  end
end
