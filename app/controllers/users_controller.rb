class UsersController < ApplicationController
  def index
    if !current_user.admin
      redirect_to root_path
    end
  end

	def new
	end

	def create
    	@user = User.new(email: params[:user][:email], name: "", password: '123456', password_confirmation: '123456')
    	if @user.save
        Extra.create(user_id: @user.id)
          AppMailer.welcome_email(@user).deliver
        	sign_in @user
        	flash[:success] = "Welcome to Funkalab!"
      		redirect_to action: 'edit', id: @user.id
    	else
      		render 'static_pages/landing'
    	end
  	end

  	def show
      @categories = Category.all
      @user = User.find(params[:id])
      @boards = @user.collections.all #to change for other users
      @collabs = @user.collaboratives.all
  	end

  def edit
    @categories = Category.all
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end

  def update
    @categories = Category.all
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank?
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to root_path
    else
      render 'edit'
    end
  end  

end
