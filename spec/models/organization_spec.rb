require "rails_helper"

RSpec.describe Organization, type: :model do

  before(:each) do
    VCR.use_cassette("model_organization") do
        @organization = create(:organization)
        @parsed_organization = OrganizationVerifier.new(@organization.ein).parse_response
    end
  end

  it "has a name" do
    expect(@parsed_organization[:name]).to eq("PRO PUBLICA INC")
  end

  it "verifies if it's an valid ein" do
    VCR.use_cassette("valid_ein") do
        @organization = create(:organization, ein: 10563036)
        @parsed_organization = OrganizationVerifier.new(@organization.ein).parse_response
    end
    VCR.use_cassette("valid_ein") do
      expect(@organization.valid_ein).to eq(true)
    end
  end

  it "returns false if there are no events associated with an organization" do
    expect(@organization.any_events?).to eq(false)
  end
end
