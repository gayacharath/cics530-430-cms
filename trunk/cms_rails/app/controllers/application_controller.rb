class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
  	if @current_user.nil? && session[:user_id]
  		@current_user = User.find(session[:user_id])
  	end
    @current_user
  end

  helper_method :current_user
  
  def is_logged_in
    if current_user.nil? 
      redirect_to login_url, :alert => "Please login First!" 
      return false
    end
  end
  #Authentication Code End
end
