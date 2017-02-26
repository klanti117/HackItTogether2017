class SessionsController < ApplicationController
  def new
  	redirect_to root_url if logged_in?
  end

  def create
    	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])  
        	log_in user
        	redirect_back_or user
  else
    	flash.now[:danger] = 'Invalid email or password' # create error message
    	render 'new'
    end
  end

  def facebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to add_username_path
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
  	log_out if logged_in?
    redirect_to root_path
  end

end