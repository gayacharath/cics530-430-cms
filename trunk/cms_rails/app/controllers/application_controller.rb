class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #Authentication Code Begin
  
  def current_user
  	if @current_user.nil? && session[:user_id]
  		@current_user = User.find(session[:user_id])
  	end
    @current_user
  end

  helper_method :current_user
  #Authentication Code End
  
end
