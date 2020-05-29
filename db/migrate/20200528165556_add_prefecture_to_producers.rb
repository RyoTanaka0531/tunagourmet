class AddPrefectureToProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :prefecture, :integer, null: false, default: 0
  end
end
