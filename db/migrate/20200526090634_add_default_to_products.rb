class AddDefaultToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :name, :string, null: false
    change_column :products, :product_image_id, :string, null: false
    change_column :products, :description, :text, null: false
    change_column :products, :price, :integer, null: false
    change_column :products, :timing, :string, null: false
    change_column :products, :producer_id, :integer, null: false
    change_column :products, :category_id, :integer, null: false
  end
end
