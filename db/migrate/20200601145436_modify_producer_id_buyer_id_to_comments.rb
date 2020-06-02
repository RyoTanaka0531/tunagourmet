class ModifyProducerIdBuyerIdToComments < ActiveRecord::Migration[5.2]
    def up
      change_column :comments, :buyer_id, :integer, null: true
      change_column :comments, :producer_id, :integer, null: true
    end
    def down
      change_column :comments, :buyer_id, :integer, null: false
      change_column :comments, :producer_id, :integer, null: false
    end
end
