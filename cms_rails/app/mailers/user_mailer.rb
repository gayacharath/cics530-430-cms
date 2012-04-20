class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def   password_reset(user)
  	@user = user
  	mail :to => user.email, :subject => "ProjectBox Password Reset Request"
  end

  def   invitation(user)
  	@user = user
	@project = Project.first
  	mail :to => user.email, :subject => "Request to contribute the project"
  end
end
