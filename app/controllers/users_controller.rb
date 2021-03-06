class UsersController < ApplicationController
  def new
   redirect_to user_path(current_user) if logged_in?
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def index
  	@user = User.all
  end

private 

def user_params
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
end


end
