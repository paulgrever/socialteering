class Event < ActiveRecord::Base
  geocoded_by :location
  after_validation :geocode
  belongs_to :organization

  def month
    event_date.strftime("%B")[0..2]
  end

  def location
    [address,city,state, zipcode].to_a.compact.join(",")
  end
end
