class CreateIndustories < ActiveRecord::Migration[5.2]
  def change
    create_table :industories do |t|
      t.string :name

      t.timestamps
    end
  end
end
