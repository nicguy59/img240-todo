class TasksController < ApplicationController
  before_action :lookup_task, except: [:index, :create]

  def index
    @tasks = Task.recent
  end

  def show
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_url, notice: 'Created task'
    else
      render 'new'
    end
  end

  def update
    @task.update(task_params)
    if @task.save
      redirect_to root_url, notice: 'Updated task'
    else
      render 'edit'
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :completed)
  end

  def lookup_task
    @task = Task.find(params[:id])
  end
end
