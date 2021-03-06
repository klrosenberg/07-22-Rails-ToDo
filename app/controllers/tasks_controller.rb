class TasksController < ApplicationController

  def index
    @tasks = Task.where("user_id = session[id]") #TODO
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  
  def show
    @task = Task.find(params[:id])
    # Loads view in views/tasks/show
  end
  
  # Form
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to tasks_path
    else
      render "edit"
    end
  end

  # Form
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new({"user_id" => session[:user_id], "description" => params["task"]["description"]})
    if @task.save
      redirect_to user_path(session[:user_id])
    else
      render "new"
    end
  end
  
  private
  
  def task_params
    params[:task].permit(:description, :user_id)
  end
end