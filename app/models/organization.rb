class Organization < ActiveRecord::Base
  attr_reader :verifier
  belongs_to :user
  validates :user_id, presence: true
  validates :ein, uniqueness: true
  validates :ein, numericality: true
  validates :ein, length: { in: 8..9 }
  validate :valid_ein
  after_create :update_organization_info
  has_many :events

  def valid_ein
    verifier = OrganizationVerifier.new(ein)
    if !verifier.validate_response?
      errors.add(:invalid_ein, "Your EIN was not found.")
    else
      true
    end
  end

  def any_events?
    events.any?
  end

  private

  def update_organization_info
    verifier = OrganizationVerifier.new(ein)
    update_attributes(verifier.parse_response)
  end
end

