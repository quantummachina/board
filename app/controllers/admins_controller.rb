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


private

  def isadm
    if !current_user.admin
      redirect_to root_path
    end
  end

end
