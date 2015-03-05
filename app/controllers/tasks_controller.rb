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
    respond_to do |fmt|
      if @task.save
        fmt.js { }
        fmt.html { redirect_to root_url, notice: 'Created task' }
      else
        fmt.js { }
        fmt.html { render 'new' }
      
        # fmt.html do
        #  render 'new'
        # end
      
      end  
    end  
  end

  def update
    respond_to do |format|  #this handles the remote function to provide only the js update
      if @task.update(task_params)
        format.js {}
        format.html do
         redirect_to root_url, notice: 'Updated task'
        end
      else
        format.js {}
        format.html {render 'edit'}
      end
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
