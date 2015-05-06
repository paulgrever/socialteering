class Api::V1::UserEventsController < ApplicationController
  respond_to :json

  def create
    respond_with UserEvent.create(user_event_params), location: nil
  end

  private

  def user_event_params
    params.require(:user_event).permit(:user_id, :event_id)
  end
end