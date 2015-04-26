require "rails_helper"

RSpec.describe OrganizationVerifier do
  context "organizaitons with valid ein" do
    it "finds organizations when they are in database" do
      VCR.use_cassette("organization") do
        @response = OrganizationVerifier.new(142007220)
      end
      expect(@response.validate_response?).to eq(true)
      @response = @response.parse_response
      expect(@response[:name]).to eq("PRO PUBLICA INC")
      expect(@response[:city]).to eq("NEW YORK")
      expect(@response[:ein]).to eq(142007220)
    end
  end

  context "organizations with invalid ein" do
    it "does find organizations when they are in database" do
      VCR.use_cassette("invalid_organization") do
        @response = OrganizationVerifier.new(999999999)
      end
      expect(@response.validate_response?).to eq(false)
    end
  end
end
