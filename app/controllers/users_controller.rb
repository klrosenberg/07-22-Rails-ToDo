class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    # Loads view in views/users/show
  end

  # Form
  def new
    @user = User.new
  end
  
  def create
    @user = User.new({name: params[:name], email: params[:email], password: [:password]})
    if @user.save
      redirect_to "/users"
    else
      render "new"
    end
  end
end