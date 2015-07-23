class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  def show
    @user = User.find(params[:id])
    # Loads view in views/users/show
  end
  
  # Form
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end

  # Form
  def new
    @user = User.new
  end
  
  # TODO add bcrypt and set session id and redirect to profile page 
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render "new"
    end
  end
  
  private
  
  def user_params
    params[:user].permit(:name, :email, :password)
  end
end