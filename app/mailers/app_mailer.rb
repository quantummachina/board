class AppMailer < ActionMailer::Base
  default from: "elite@funkalab.com"

  def welcome_email(user)
    @user = user
    @url  = "http://www.funkalab.com/signin"
    mail(:to => user.email, :subject => "Funkalab te la mete!")
  end
end
