class ModifyProducerIdBuyerIdToLikes < ActiveRecord::Migration[5.2]
  def up
    change_column :likes, :buyer_id, :integer, null: true
    change_column :likes, :producer_id, :integer, null: true
  end
  def down
    change_column :likes, :buyer_id, :integer, null: false
    change_column :likes, :producer_id, :integer, null: false
  end
end
