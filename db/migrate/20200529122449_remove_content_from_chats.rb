class RemoveContentFromChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :content, :string
  end
end
