class RemoveIdFromMessages < ActiveRecord::Migration[5.2]
  def change
    #remove_column :messages, :room_id, :integer
    add_column :messages, :chat_id, :integer
  end
end
