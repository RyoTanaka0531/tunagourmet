class AddNameToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :name, :string
    add_column :products, :product_image_id, :string
    add_column :products, :description, :text
    add_column :products, :price, :integer
    add_column :products, :timing, :string
    add_column :products, :producer_id, :integer
    add_column :products, :category_id, :integer
  end
end
