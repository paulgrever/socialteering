require "rails_helper"

RSpec.describe User, type: :model do
  context "with all the correct credentials" do
    let(:user) { create(:user) }

    it "has a name" do
      expect(user.first_name).to eq("Test")
      expect(user.last_name).to eq("User")
      expect(user.full_name).to eq("Test User")
    end

    it "has the correct contact information" do
      expect(user.email).to eq("TestUser@example.com")
      expect(user.phone_number).to eq("5552223333")
    end

    it "has facebook info" do
      expect(user.uid).to eq("12345")
      expect(user.provider).to eq("Facebook")
      expect(user.image).to eq("socialteering.png")
      expect(user.location).to eq("Denver")
    end
  end

  context "with some of the required user information" do
    let(:user) { create(:user) }

    it "is invalid without an email" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is invalid withincorrect email" do
      user.email = "fake_email"
      expect(user).to_not be_valid
    end

    it "is invalid without a uid" do
      user.uid = nil
      expect(user).to_not be_valid
    end

    it "is invalid without a provider" do
      user.provider = nil
      expect(user).to_not be_valid
    end

    it "is invalid with a token" do
      user.token= nil
      expect(user).to_not be_valid
    end
  end
end
