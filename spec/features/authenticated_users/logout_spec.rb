require "rails_helper"

RSpec.describe "Authenticated user", type: :feature do

  it "destroys the sesson when logging out" do
    facebook_login
    visit root_path
    click_link_or_button("Sign in with Facebook")
    expect(page).to have_content("test_name")
    click_link_or_button("Sign out")
    expect(page).to_not have_content("test_name")
    expect(page).to have_content("You have successfully signed out.")
  end
end
