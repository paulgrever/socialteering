class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.float :distance
      t.string :url
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.string :display_phone
      t.string :image_url
    end
  end
end
