require "rails_helper"

RSpec.describe "Unauthenticated user", type: :feature do
  it "can view volunteer" do
    visit root_path
    expect(page).to have_content("Volunteer")
  end

  it "see login info " do
    visit root_path
    expect(page).to have_content("Sign in with Facebook")
  end

  it "cannot see login confirmation" do
    user = create(:user)
    visit root_path
    expect(page).to_not have_content(user.full_name)
  end
end
