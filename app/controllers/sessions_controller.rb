class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_or_create_from_auth(request.env["omniauth.auth"])
    if user
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.full_name}."
      redirect_to root_path
    else
      flash[:danger] = "Invalid login."
      render(:new)
    end
  end

  def destroy
    flash[:success] = "You have successfully signed out."
    session.clear
    redirect_to root_path
  end
end
