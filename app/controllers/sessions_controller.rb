# encoding: utf-8
class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      if user.collections.count == 0
        redirect_to root_path
      else
        redirect_to user
      end
    else
      flash.now[:error] = 'Combinación inválida. Intenta nuevamente.' 
      render 'new'
    end
  end

  def destroy
    session[:fb_access_token] = nil
    session[:fb_user_uid] = nil
    sign_out
    redirect_to root_path
  end

end