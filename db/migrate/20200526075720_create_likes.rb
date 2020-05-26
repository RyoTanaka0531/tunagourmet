class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :post_id
      t.integer :producer_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
