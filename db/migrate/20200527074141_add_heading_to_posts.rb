class AddHeadingToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :heading, :string, null: false, default: ''
  end
end
