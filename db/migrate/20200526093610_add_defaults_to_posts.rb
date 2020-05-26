class AddDefaultsToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :producer_id, :integer, null: false
    change_column :posts, :buyer_id, :integer, null: false

  end
end
