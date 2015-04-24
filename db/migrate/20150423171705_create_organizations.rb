class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.integer :ein
      t.string :name
      t.string :stein
      t.string :careofname
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :organization_type
      t.string :phone_number
      t.string :email
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
