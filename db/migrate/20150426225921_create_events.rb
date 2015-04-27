class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :event_date
      t.time :event_start
      t.time :event_end
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.integer :organization_id

      t.timestamps null: false
    end
  end
end
