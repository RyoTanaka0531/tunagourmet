class ModifyIndustoryToBuyers < ActiveRecord::Migration[5.2]
  def up
    change_column :buyers, :industory, :integer, null: false, default: 0
  end
  def down
    change_column :buyers, :industory, :boolean, null: false, default: false
  end
end
