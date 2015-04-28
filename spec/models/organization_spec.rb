require "rails_helper"

RSpec.describe Organization, type: :model do
  context "with valid information"
    before(:each)do
      VCR.use_cassette("model_organization") do
          @organization = create(:organization)
          @parsed_organization = OrganizationVerifier.new(@organization.ein).parse_response
      end
      it "has a name" do
        expect(@parsed_organization.name).to eq("PRO PUBLICA INC")
      end

      it "verifies if it's an valid ein" do
        expect(@organization.valid_ein).to eq(true)
      end

      it "returns false if there are no events associated with an organization" do
        expect(@parsed_organization.any_events?).to eq(false)
      end
  end

  # context "with invalid information" do
  #   it "is invalid with an invalid ein " do
  #     VCR.use_cassette("model_organization") do
  #       @organization = create(:organization, ein: 9900)
  #       @parsed_organization = OrganizationVerifier.new(@organization.ein).parse_response
  #     end
  #   end
   
  # end
end
