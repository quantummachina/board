# encoding: utf-8
class UsersController < ApplicationController
  def index
    category = params[:category] || ""
    @categories = Category.all
    #@size = 3 #boards size

    case category
    when "2"
      @users = User.find_all_by_c_art(true)
    when "7"
      @users = User.find_all_by_c_video(true)
    when "5"
      @users = User.find_all_by_c_music(true)
    when "17"
      @users = User.find_all_by_c_tecnology(true)
    when "22"
      @users = User.find_all_by_c_design(true)
    else
      @users = User.all
    end
    respond_to do |format|
        format.html { }
        format.js
      end
  end

	def new
    @user = User.new

    if params.has_key?(:state)
      @state = params[:state]
    else
      if @user.city_id != 0
        @state = @user.city.state.id
      else  
        @state = 0
      end
    end

    if @state == 0 
      @cities = []
    else
      @cities = State.find(@state).cities
    end

    #@state = params[:state]  || (if @user.city_id != 0 then @user.city.state.id end) || 0
    @states = State.all
    @categories = Category.all

    respond_to do |format|
        format.html { }
        format.js
    end
	end

	def create
    	@user = User.new(params[:user])
    	if @user.save
        Extra.create(user_id: @user.id)
        Uoption.create(user_id: @user.id)
        AppMailer.welcome_email(@user).deliver
        search_pending(@user.email, @user.id)
        sign_in @user
      	flash[:success] = "¡Bienvenido a Funkalab!"
        redirect_to collections_path
    	else
      		#render 'static_pages/landing'
          redirect_to root_path
    	end
  	end

  	def show
      @categories = Category.all
      @user = User.find(params[:id])
      #array to separate finished collab
      finished_collab = []
      unfinished_collab = []
      @user.collaboratives.each do |c|
        if c.status == 5
          finished_collab << c.id
        else
          unfinished_collab << c.id
        end
      end
       @user.collections.each do |c|
        if c.status == 5
          finished_collab << c.id
        end
      end
      #
      @boards = Collection.where("status != 5 AND user_id = ?", @user.id)
      @collabs = Collection.where(id: unfinished_collab)
      @fboards = Collection.where(id: finished_collab)
  	end

  def edit
    
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end

    if params.has_key?(:state)
      @state = params[:state]
    else
      if @user.city_id != 0
        @state = @user.city.state.id
      else  
        @state = 0
      end
    end

    if @state == 0 
      @cities = []
    else
      @cities = State.find(@state).cities
    end

    #@state = params[:state]  || (if @user.city_id != 0 then @user.city.state.id end) || 0
    @states = State.all
    @categories = Category.all

    respond_to do |format|
        format.html { }
        format.js
    end

  end

  def update
    @categories = Category.all
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank?
    if @user.update_attributes(params[:user])
      flash[:success] = "Tu perfil ha sido actualizado."
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end  

  def reset_password
    u = User.find_by_email(params[:email])
    if u
      np= ('a'..'z').to_a.shuffle[0..5].join
      u.update_attributes(password: np, password_confirmation: np)

      AppMailer.password_restar_email(u, np).deliver

      flash[:success] = 'Tu nueva contraseña hasido enviada exitosamente.' 
      redirect_to '/signin'
      
    else
      flash[:error] = 'Este correo electrónico no está registrado en Funkalab. Verifícalo por favor.' 
      redirect_to '/reset_password'
    end
    
  end

  def pay
    require 'net/http'
    paypal = 'https://www.paypal.com/cgi-bin/webscr?cmd=_notify-validate'
    uri = URI.parse(paypal)
    http = Net::HTTP.new(uri.host, uri.port)
    http.open_timeout = 60
    http.read_timeout = 60
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    response = http.post(uri.request_uri, request.raw_post, 'Content-Length' => "#{request.raw_post.size}",
                       'User-Agent' => "My custom user agent"
                       ).body
    if response == 'VERIFIED'
      #validar
      unique = params[:invoice].to_s
      rnd = unique[0..3].to_i
      uid = unique[4..unique.length].to_i
      if User.find(uid).uoption.temp_pay == rnd
        User.find(uid).uoption.update_attributes(temp_pay: -1)
      end
      #fin validacion
      #Checar si dirige correctamente. 2. redireccion cuando falla. 3. migracion "profitable" 4. migracion campos faltantes. 5. campos en form. LISTO!
      flash[:success] = 'Pago recibido. Prosigue con tu proyecto.'
      #redirect_to new_collection_path
    else
      flash[:error] = 'Pago fallido, intente de nuevo'
      #redirect_to '/newproject'
    end
    #flash[:success] = 'Pay'
    
  end
  
private

  def search_pending(email, id)
    p = Pendinguser.find_by_email(email)
    if !p.nil?
        Request.create(user_id: id, from_id: p.from, collection_id: p.collection, invite: true)
        User.find(id).extra.update_attributes(requests: 1)
        p.delete
    end
  end

end
