class AddDefaultToComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :post_id, :integer, null: false
    change_column :comments, :producer_id, :integer, null: false
    change_column :comments, :buyer_id, :integer, null: false
    change_column :comments, :content, :text, null: false

  end
end
