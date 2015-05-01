class Business < ActiveRecord::Base
  def self.service
    @service ||= YelpService.new
  end

  def self.event_search(coordinates, search_term, radius_diameter = 1000, sort_filter  = 0)
    service.radius_search(coordinates, search_term, radius_diameter, sort_filter).businesses
  end
end
