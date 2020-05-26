class RemoveColumnsFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :name, :string
    remove_column :products, :product_image_id, :string
    remove_column :products, :description, :text
    remove_column :products, :price, :integer
    remove_column :products, :timing, :string
    remove_column :products, :producer_id, :integer
    remove_column :products, :category_id, :integer
  end
end
