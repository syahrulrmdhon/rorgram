class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in"
    else
      flash.now.alert = "username / password invalid"
      render "new"
    end
  end

  def show
    reset_session
    redirect_to root_url, notice:"logged out"
  end
end
