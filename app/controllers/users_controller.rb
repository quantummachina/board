class UsersController < ApplicationController
	def new
	end

	def create
    	@user = User.new(email: params[:user][:email], name: "", password: '123456', password_confirmation: '123456')
    	if @user.save
          #AppMailer.welcome_email(@user).deliver
        	sign_in @user
        	flash[:success] = "Welcome to Funkalab!"
      		redirect_to action: 'edit', id: @user.id
    	else
      		render 'static_pages/landing'
    	end
  	end

  	def show
  	end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to root_path
    else
      render 'edit'
    end
  end  

end
