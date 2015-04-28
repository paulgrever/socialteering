class Event < ActiveRecord::Base
  belongs_to :organization

  def month
    event_date.strftime("%B")[0..2]
  end
end
