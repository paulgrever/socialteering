require "rails_helper"

RSpec.describe "Organization user", type: :feature do
  it "can see it's organizations on home page" do
    VCR.use_cassette("feature_organization") do 
      visit root_path
      expect(page).to_not have_content("My Organizations")
      facebook_login
      visit root_path
      click_link_or_button("Sign in with Facebook")
      expect(page).to_not have_content("My Organizations")
      visit new_organization_path
      fill_in("organization[ein]", with: 142007220)
      click_link_or_button("Register my EIN")
      expect(page).to have_content("PRO PUBLICA INC")
    end
  end
end
