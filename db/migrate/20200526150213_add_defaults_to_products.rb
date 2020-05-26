class AddDefaultsToProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :product_image_id, :string, null: true

  end
end
