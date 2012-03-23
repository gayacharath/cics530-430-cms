class SessionsController < ApplicationController

  respond_to :html, :xml, :json

  def new
    if current_user
      redirect_to user_path(current_user), :alert => "You are already logged in"
    else
      render
    end
  end
  	
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(current_user), :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
