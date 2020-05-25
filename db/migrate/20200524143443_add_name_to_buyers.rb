class AddNameToBuyers < ActiveRecord::Migration[5.2]
  def change
    add_column :buyers, :name, :string, null: false, default: ''
    add_column :buyers, :kana_name, :string, null: false, default: ''
    add_column :buyers, :company_name, :string, null: false, default: ''
    add_column :buyers, :kana_company_name, :string, null: false, default: ''
    add_column :buyers, :phone_number, :string, null: false, default: ''
    add_column :buyers, :postcode, :string, null: false, default: ''
    add_column :buyers, :adress, :string, null: false, default: ''
    add_column :buyers, :industory, :boolean, null: false, default: 0
    add_column :buyers, :description, :text
    add_column :buyers, :profile_image_id, :string
    add_column :buyers, :hp, :string
    add_index :company_name
  end
end
