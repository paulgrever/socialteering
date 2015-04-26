class Organization < ActiveRecord::Base
  attr_reader :verifier
  belongs_to :user
  validates :ein, uniqueness: true
  validates :ein, numericality: true
  validates :ein, length: { in: 8..9 }
  validate :valid_ein
  after_create :update_organization_info

  def valid_ein
    verifier = OrganizationVerifier.new(ein)
    if !verifier.validate_response?
      errors.add(:invalid_ein, "Your EIN was not found.")
    else
      true
    end
  end

  private

  def update_organization_info
    verifier = OrganizationVerifier.new(ein)
    update_attributes(verifier.parse_response)
  end
end
