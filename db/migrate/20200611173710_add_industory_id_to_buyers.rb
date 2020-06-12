class AddIndustoryIdToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :industory_id, :integer
    add_column :buyers, :prefecture_id, :integer
    add_column :producers, :prefecture_id, :integer
    remove_column :buyers, :industory, :integer, null: false, default: 0
    remove_column :buyers, :prefecture, :integer, null: false, default: 0
    remove_column :producers, :prefecture, :integer, null: false, default: 0
  end
end
