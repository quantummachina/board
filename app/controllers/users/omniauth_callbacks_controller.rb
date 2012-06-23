class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    
    auth = request.env['omniauth.auth']
    session[:fb_user_uid] = auth['uid']
    token = auth['credentials']['token']
    session[:fb_access_token] = token

    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    session[:fb_access_token] = nil
    
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in @user
      redirect_to @user
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end