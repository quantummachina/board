class AppMailer < ActionMailer::Base
  default from: "macaco@funkalab.com"

  def welcome_email(user)
    @user = user
    @url  = "http://www.funkalab.com/signin"
    mail(:to => user.email, :subject => "Welcome to Funkalab!")
  end

  def invite_email(invited, inviter)
    @invited = invited
    @invter = inviter
    @url  = "http://www.funkalab.com/signin"
    mail(:to => invited.email, :subject => inviter.name+" has invited you to collaborate!")
  end
end
