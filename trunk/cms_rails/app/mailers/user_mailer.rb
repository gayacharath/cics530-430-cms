class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def   password_reset(user)
  	@user = user
  	mail :to => user.email, :subject => "ProjectBox Password Reset Request"
  end

  def   invitation(user, project)
  	@user = user
	@project = project
  	mail :to => user.email, :subject => "Request to join the project"
  end
end
