class SessionsController < ApplicationController

	#def new
		#render :new
	#end
	
#Authentication Code Begin
def create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to user_url(:id => user.id), :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end
#Authentication Code End

end