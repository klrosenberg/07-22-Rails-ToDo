class UsersController < ApplicationController

  def login
    @user = User.where("email" => params["user"]["email"])
    password_guess = params["user"]["password"]
    
    actual_password = BCrypt::Password.new(@user[0].password)
    session[:user_id] = @user[0].id
    
    if password_guess == actual_password
      redirect_to user_path
    else
      @user.errors << "Please enter the correct email/password combination."
      render "login"
  end

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
    the_password = BCrypt::Password.create(params["user"]["password"])
    @user = User.new({"email" => params["user"]["email"], "name" => params["user"]["name"], "password" => the_password})
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path
    else
      render "new"
    end
  end
  
  private
  
  def user_params
    params[:user].permit(:name, :email, :password)
  end
end