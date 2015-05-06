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

  context " logged in" do 
    before(:each ) do 
      VCR.use_cassette("feature_organization") do
        visit root_path
        facebook_login
        visit root_path
        click_link_or_button("Sign in with Facebook")
        visit new_organization_path
        fill_in("organization[ein]", with: 142007220)
        click_link_or_button("Register my EIN")
      end
    end

    it "can create an event" do
      expect(Event.count).to eq(0)
      VCR.use_cassette("create_event") do 
        fill_in("event[name]", with: "Test Event")
        fill_in("event[short_description]", with: "short description")
        fill_in("event[long_description]", with: "long description")
        fill_in("event[address]", with: "1510 Blake St")
        fill_in("event[city]", with: "Denver")
        fill_in("event[state]", with: "CO")
        fill_in("event[zipcode]", with: "80202")
        select("2016", :from => "event[event_date(1i)]")
        select("June", :from => "event[event_date(2i)]")
        select("5", :from => "event[event_date(3i)]")
        select("02", :from => "event[event_start(4i)]")
        select("02", :from => "event[event_start(5i)]")
        select("15", :from => "event[event_end(4i)]")
        select("15", :from => "event[event_end(5i)]")
        click_link_or_button("Create Event")
        expect(Event.count).to eq(1)
        expect(Event.first.latitude).to eq(39.749568939209 )
      end
    end

    it "does something" do
      
    end

  end
end
