# encoding: utf-8
class AppMailer < ActionMailer::Base
  helper :mail   # loads app/helpers/mail_helper.rb & includes MailHelper
  
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

  def comment_notification_email(to, comment)
    @from = comment.user
    @to = to
    @text = comment.text
    @project = comment.collection
    @project_url = 'http://www.funkalab.com/collections/'+@project.id.to_s
    mail(:to => @to.email, :subject => @from.name + " ha comentado en el proyecto " + @project.title)
  end
#http://localhost:3000/conversations?interlocutor_id=6&user_id=10

  def password_restar_email(user, pass)
    @user = user
    @password = pass
    mail(:to => @user.email, :subject => "Tu nueva contraseña en Funkalab")
  end

  def massive_email(user,subject,body,signature)
    @user = user
    @body = body
    @signature = signature
    mail(to: user.email, subject: subject)
  end

  def share_email(email, collection, name, message)
    @email = email
    @collection = collection
    @name = name
    @message = message
    @project_url = 'http://www.funkalab.com/collections/'+@collection.id.to_s
    mail(:to => @email, :subject => @name + " te ha compartido el proyecto "+ @collection.title)
  end

  def cfollow_notification_email(from, collection)
    @from = from
    @to = collection.user
    @project = collection
    @project_url = 'http://www.funkalab.com/collections/'+@project.id.to_s
    @from_url = 'http://www.funkalab.com/users/'+@from.id.to_s
    mail(:to => @to.email, :subject => @from.name + " ha seguido tu proyecto " + @project.title)
  end

  def ufollow_notification_email(from, to)
    @from = from
    @to = to
    @from_url = 'http://www.funkalab.com/users/'+@from.id.to_s
    mail(:to => @to.email, :subject => @from.name + " te está siguiendo")
  end

end
