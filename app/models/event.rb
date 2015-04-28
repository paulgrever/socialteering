class Event < ActiveRecord::Base
  validates :name, presence: true
  geocoded_by :location
  after_validation :geocode
  validate :future?
  belongs_to :organization

  def month
    event_date.strftime("%B")[0..2]
  end

  def location
    [address,city,state, zipcode].to_a.compact.join(",")
  end

  def future?
    Date.today < event_date  
  end
end
