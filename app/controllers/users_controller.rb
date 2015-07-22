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
end