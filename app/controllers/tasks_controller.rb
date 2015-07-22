class TasksController < ApplicationController
  
  def index
    @user = User.find(id)
    if @tasks = Tasks.where("user.id = @user.id")
    else
    end
  end
  
  # Form
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(user_params)
    if @task.save
      redirect_to tasks_path
    else
      render "new"
    end
  end
end