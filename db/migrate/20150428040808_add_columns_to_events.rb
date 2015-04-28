class AddColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :short_description, :string
    add_column :events, :long_description, :text
    add_column :events, :image_url, "string", default: "socialteering_placeholder.png"
  end
end
