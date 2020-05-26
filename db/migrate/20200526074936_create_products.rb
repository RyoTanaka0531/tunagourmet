class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_image_id
      t.text :description
      t.integer :price
      t.string :timing
      t.integer :producer_id
      t.integer :category_id

      t.timestamps
    end
    add_index :products, :name
  end
end
