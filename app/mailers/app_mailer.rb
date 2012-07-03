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

  def help_notification_email(owner, helper, project)
    @owner = owner
    @helper = helper
    @project = project
    @project_url = 'http://www.funkalab.com/collections/'+project.id.to_s
    @helper_url = 'http://www.funkalab.com/users/'+helper.id.to_s
    @messages_url = 'http://www.funkalab.com/conversations'
    mail(:to => owner.email, :subject => helper.name + " wants to help you with your project!")
  end
end
