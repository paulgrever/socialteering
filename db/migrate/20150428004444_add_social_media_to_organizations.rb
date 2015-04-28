class AddSocialMediaToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :facebook_url, :string
    add_column :organizations, :twitter_url, :string
    add_column :organizations, :google_plus_url, :string
    add_column :organizations, :description, :text
    add_column :organizations, :website, :string
  end
end
