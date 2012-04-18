class InvitationsController < ApplicationController

	respond_to :html, :xml, :json

	def create
		@user = User.find_by_email(params[:user_id])
		@project = Project.find(params[:project_id])
		#if Invitation.create(:project => @project, :user => @user)
		if user
		@user.send_invitation 
		redirect_to project_path, :notice => "Request to contribute the project has been sent"
		else
		redirect_to project_path, :notice => "I couldn't send invitation"
		end
	end
	
end
