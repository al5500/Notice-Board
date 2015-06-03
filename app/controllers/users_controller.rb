class UsersController < ApplicationController
  
   before_action :check_if_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = @current_user
    render :edit
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def update  
    user = @current_user
    user.update user_params
    redirect_to root_path
  end

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to users_path
  end

  private 
  def user_params
    params.require(:user).permit(:name, :suburb, :email, :phone, :image, :password, :password_confirmation)
  end

end
