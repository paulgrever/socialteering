class BusinessesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    coordinates = [@event.latitude, @event.longitude]
    @businesses = Business.event_search(coordinates,
                                        params[:event][:term],
                                        params[:event][:distance].to_i,
                                        params[:event][:sort_type].to_i)
  end

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    binding.pry
    redirect_to root_path
  end
end
