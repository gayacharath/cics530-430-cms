class InvitationsController < ApplicationController

	respond_to :html, :xml, :json

	def show
		user = User.find(params[:id])
		if user
		   user.send_invitation 
		   redirect_to user_path(:id => current_user.id), :notice => "An email has been sent to #{user.name}"
		else
		   redirect_to user_path(:id => current_user.id), :alert => "You are not registered. Click sign up to register"
		end
        end
	
end
