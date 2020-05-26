class AddDefaultToChats < ActiveRecord::Migration[5.2]
  def change
    change_column :chats, :producer_id, :integer, null: false
    change_column :chats, :buyer_id, :integer, null: false
    change_column :chats, :content, :string, null: false
  end
end
