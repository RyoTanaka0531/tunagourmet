class AddIsDeletedToProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :is_deleted, :boolean, default: false
    add_column :buyers, :is_deleted, :boolean, default: false
  end
end
