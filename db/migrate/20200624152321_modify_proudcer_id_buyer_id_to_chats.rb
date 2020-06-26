class ModifyProudcerIdBuyerIdToChats < ActiveRecord::Migration[5.2]
  def up
    change_column :chats, :buyer_id, :integer, null: true
    change_column :chats, :producer_id, :integer, null: true
  end
  def down
    change_column :chats, :buyer_id, :integer, null: false
    change_column :chats, :producer_id, :integer, null: false
  end
end
