class AdminsController < ApplicationController
  before_filter :isadm
  def admin

    #p = HTTParty.get('http://hellokisses.com/')
    #s = p.to_s
    #@i = s[/http:\/\/imc1.hellokisses.com\/.+?\.(jpg|jpeg|bmp|gif|png)/]
  end

  def statistics
    @np = Collection.all.count
    @nu = User.all.count
    @u1c = User.joins(:collections).uniq.all.count
    @p1c = Collection.joins(:comments).uniq.all.count
    @p1co =  Collection.joins(:collaborations).uniq.all.count
    @p1s =  Collection.joins(:requests).uniq.all.count
    @u1pco = User.joins(:collections, :collaborations).uniq.all.count

    @pTco = Collection.select("collections.id, collections.title, count(collaborations.id) AS collaborations_count").joins(:collaborations).group("collections.id").reorder("collaborations_count DESC").limit(5)
    @pTc = Collection.select("collections.id, collections.title, count(comments.id) AS comments_count").joins(:comments).group("collections.id").reorder("comments_count DESC").limit(5)


    
  end

  def users
    @users = User.reorder('created_at DESC').all
  end

  def quarantine
    @collections = Collection.find_all_by_quarantine(true)
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
