class UserMailer < ActionMailer::Base
  default from: "noreply@projectbox.com"

  def password_reset(user)
  	@user = user
  	mail :to => user.email, :subject => "ProjectBox Password Reset Request"
  end
end
