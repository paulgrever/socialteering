class AddBusinessIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :business_id, :integer
  end
end
