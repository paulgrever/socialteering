class Organization < ActiveRecord::Base
  after_create :fetch_org_data
  
  private

  def fetch_org_data
    verifier = OrganizationVerifier.new(ein)
    if verifier.verified
      update_attributes(verifier.data)
    else
      update_attribute(:verified, false)
    end
  end
end
