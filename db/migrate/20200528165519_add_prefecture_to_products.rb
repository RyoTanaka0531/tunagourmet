class AddPrefectureToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :prefecture, :integer, null: false, default: 0
  end
end
