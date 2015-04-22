require "rails_helper"


RSpec.describe "Unauthenticated user", type: :feature do
  it "is created when logging in" do
    visit root_path
    expect(User.count).to eq(0)
    expect(page).to_not have_content("test")
    facebook_login
    visit root_path
    click_link_or_button("Sign in with Facebook")
    expect(User.count).to eq(1)
    expect(page).to have_content("test_name")
  end
end