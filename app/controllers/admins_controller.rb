class AdminsController < ApplicationController
  before_filter :isadm
  def admin

    #p = HTTParty.get('http://hellokisses.com/')
    #s = p.to_s
    #@i = s[/http:\/\/imc1.hellokisses.com\/.+?\.(jpg|jpeg|bmp|gif|png)/]
  end

  def users
    @users = User.reorder('created_at DESC').all
  end

  def massemail
    @test = params[:test] || ''
    @subject = params[:subject] || ''
    @body = params[:body] || ''
    @signature = params[:signature] || ''
    if params[:commit] == 'Send!'
      User.all.each do |u|
        AppMailer.massive_email(u,@subject, @body, @signature).deliver
      end
      flash[:success] = "Mensajes Enviados"
      redirect_to '/massemail'
    end
    respond_to do |format|
      format.html { }
      format.js
    end
  end


private

  def isadm
    if !current_user.admin
      redirect_to root_path
    end
  end

end
