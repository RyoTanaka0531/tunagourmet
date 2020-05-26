class AddDefaultToLikes < ActiveRecord::Migration[5.2]
  def change
    change_column :likes, :post_id, :integer, null: false
    change_column :likes, :producer_id, :integer, null: false
    change_column :likes, :buyer_id, :integer, null: false



  end
end
