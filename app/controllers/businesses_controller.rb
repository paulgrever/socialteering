class BusinessesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @event.latitude_and_longitude?
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
    @event = Event.find(params[:event_id])
    @business = Business.new(name: params[:business][:name],
                             distance: params[:business][:distance],
                             url: params[:business][:url],
                             address: params[:business][:name].to_s,
                             latitude: params[:business][:latitude].to_f,
                             longitude: params[:business][:longitude].to_f,
                             phone: params[:business][:phone],
                             display_phone: params[:business][:display_phone],
                             image_url: params[:business][:image_url])
    if @business.save
      @event.update_attribute(business_id: @business.id)
      redirect_to organization_path(@event.organization_id)
    else
      flash[:danger] = "This business could not be selected"
      render :back
    end
  end

  private

  def business_params
    params.require(:business).permit(:name,
                                     :distance,
                                     :url,
                                     :address,
                                     :latitude,
                                     :longitude,
                                     :phone,
                                     :display_phone,
                                     :image_url)
  end
end
