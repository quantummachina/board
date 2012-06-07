class AppMailer < ActionMailer::Base
  default from: "mac@funkalab.com"

  def welcome_email(user)
    @user = user
    @url  = "http://www.funkalab.com/signin"
    mail(:to => user.email, :subject => "Welcome to Funkalab!")
  end

  def invite_email(email, inviter, password)
    @inviter = inviter
    @password = password
    @url  = "http://www.funkalab.com/signin"
    mail(:to => email, :subject => inviter.name+" has invited you to collaborate!")
  end
end
