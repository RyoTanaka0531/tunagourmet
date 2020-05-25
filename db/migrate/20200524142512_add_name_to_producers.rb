class AddNameToProducers < ActiveRecord::Migration[5.2]
  def change
    add_column :producers, :name, :string, null: false, default: ''
    add_column :producers, :kana_name, :string, null: false, default: ''
    add_column :producers, :company_name, :string, null: false, default: ''
    add_column :producers, :kana_company_name, :string, null: false, default: ''
    add_column :producers, :phone_number, :string, null: false, default: ''
    add_column :producers, :description, :text
    add_column :producers, :profile_image_id, :string
    add_column :producers, :postcode, :string, null: false, default: ''
    add_column :producers, :address, :string, null: false, default: ''
    add_column :producers, :hp, :string
    add_index  :producers, :company_name
  end
end
