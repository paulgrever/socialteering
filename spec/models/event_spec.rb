require "rails_helper"

RSpec.describe Event, type: :model do
  before(:each) do
    VCR.use_cassette("event") do
        @organization = create(:organization)
        @parsed_organization = OrganizationVerifier.new(@organization.ein).parse_response
    end
    VCR.use_cassette("event_geocode") do
      @event = create(:event, organization_id: @organization.id)
    end
  end

  it "has a name" do
    expect(@event.name).to eq("Event Name")
  end

  it "has longitude from address" do
    expect(@event.longitude).to eq(-104.99996185302734)
  end

  it "has latitude from address" do
    expect(@event.latitude).to eq(39.749568939208984)
  end

  it "can translate to latitude and longitude" do
    expect(@event.location).to eq("1510 Blake St,Denver,CO,80202")
  end

  it "abbreviates the month" do
    expect(@event.month).to eq("Jan")
  end

  it "verifiies if the event date is in future" do
    expect(@event.future?).to eq(true)
  end

  it "is invalid if events are in the past" do
    @event.event_date = "1994-01-21"
    expect(@event.future?).to eq(["Please make your event in the future."])
  end
end
