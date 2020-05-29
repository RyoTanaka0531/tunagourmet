class AddPrefectureToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :prefecture, :integer, null: false, default: 0
  end
end
