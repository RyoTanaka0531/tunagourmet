class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :producer_id
      t.integer :buyer_id
      t.string :content

      t.timestamps
    end
  end
end
