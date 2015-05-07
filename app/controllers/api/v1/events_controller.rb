class Api::V1::EventsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Event.future
  end

  def show
    respond_with Event.find_by(id: params[:id])
  end
end
