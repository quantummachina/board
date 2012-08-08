class AppMailer < ActionMailer::Base
  default from: "hello@funkalab.com"

  def welcome_email(user)
    @user = user
    @url  = "http://www.funkalab.com/signin"
    mail(:to => user.email, :subject => "Bienvenido a Funkalab")
  end

  def invite_email(email, inviter, collection, category )
    @inviter = inviter
    @collection = collection
    @category = category
    mail(:to => email, :subject => inviter.name + " te ha invitado a colaborar en su proyecto "+ collection.title )
  end

  def help_notification_email(owner, helper, project, request)
    @owner = owner
    @helper = helper
    @project = project
    @request = request
    @project_url = 'http://www.funkalab.com/collections/'+project.id.to_s
    @helper_url = 'http://www.funkalab.com/users/'+helper.id.to_s
    @request_url = 'http://www.funkalab.com/requests/'
    mail(:to => owner.email, :subject => helper.name + " quiere colaborar contigo en Funkalab")
  end

  def invite_notification_email(request)
    @invited = request.user
    @from = User.find(request.from_id)
    @project = request.collection
    @request = request
    @project_url = 'http://www.funkalab.com/collections/'+@project.id.to_s
    @from_url = 'http://www.funkalab.com/users/'+@from.id.to_s
    @request_url = 'http://www.funkalab.com/requests/'
    mail(:to => @invited.email, :subject => @from.name + " te ha invitado a colaborar en su proyecto "+ @project.title)
  end

  def accept_notification_email(request)
    @user = request.user
    @from = User.find(request.from_id)
    @project = request.collection
    @project_url = 'http://www.funkalab.com/collections/'+@project.id.to_s
    @user_url = 'http://www.funkalab.com/users/'+@user.id.to_s
    if request.invite == true
      @text = " ha aceptado unirse a tu proyecto "
    else
      @text = " te ha aceptado en el proyecto "
    end
    mail(:to => @from.email, :subject => @user.name + @text + @project.title)
  end

  def message_notification_email(from, to, line)
    @from = from
    @to = to
    @line = line
    mail(:to => @to.email, :subject => @from.name + " te ha enviado un mensaje.")
  end
#http://localhost:3000/conversations?interlocutor_id=6&user_id=10
end
