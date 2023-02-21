class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @tasks = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create 
    @task = Task.new(task_params)
    @task.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to task_path(@task)
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to root_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
