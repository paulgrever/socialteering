class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Your event has been created"
      redirect_to businesses_path
    else
      flash[:danger] = "Your event could not be created at this time"
      redirect_to :back
    end
  end

  def show
  end


  private

  def event_params
    params.require(:event).permit(:name,
                                  :event_date,
                                  :event_start,
                                  :event_end,
                                  :address,
                                  :city,
                                  :state,
                                  :zipcode,
                                  :latitude,
                                  :longitude,
                                  :organization_id,
                                  :short_description,
                                  :long_description,
                                  :image_url)
  end
end
