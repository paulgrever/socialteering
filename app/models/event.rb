class Event < ActiveRecord::Base
  validates :name, presence: true
  geocoded_by :location
  after_validation :geocode
  validate :future?
  belongs_to :organization
  belongs_to :business
  scope :future, -> { where(["event_date > ?", Date.today]).order(:event_date) }

  def month
    event_date.strftime("%B")[0..2]
  end

  def location
    [address, city, state, zipcode].to_a.compact.join(",")
  end

  def future?
    if Date.today < event_date
      true
    else
      errors.add(:future?, "Please make your event in the future.")
    end
  end

  def latitude_and_longitude?
    if latitude.nil? && longitude.nil?
      proximity = Geocoder.coordinates(city)
      update_attributes(latitude: proximity[0], longitude: proximity[1])
    end
  end
end
