class BusinessesController < ApplicationController
  def index
    @event = Event.last
    coordinates = [@event.latitude, @event.longitude]
    @businesses = Business.event_search(coordinates, "coffee", 2000, 2)
  end
end
