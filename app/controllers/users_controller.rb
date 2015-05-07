class UsersController < ApplicationController
  def show
    @events = User.find_by(id: params[:id]).events.future
  end
end
