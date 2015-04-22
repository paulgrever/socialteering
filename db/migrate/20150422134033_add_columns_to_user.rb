class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :full_name, :string
    add_column :users, :gender, :string
    add_column :users, :facebook_page, :string
  end
end
