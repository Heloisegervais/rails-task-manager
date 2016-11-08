class TasksController < ApplicationController

  def index
  @tasks = Task.all        # GET /restaurants
  end

  def show
  @task = Task.find(params[:id])        # GET /restaurants/:id
  end

  def new
   @task = Task.new # GET /restaurants/new
  end

  def create        # POST /restaurants
    @task = Task.new(task_params)
    @task.save
  # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to task_path(@task)
  end

  def edit
   @task = Task.find(params[:id]) # GET /restaurants/:id/edit
  end

  def update (task_params)
    @task = Task.find(params[:id])
    @task.update(task_params)      # PATCH /restaurants/:id
  end

  def destroy       # DELETE /restaurants/:id

  @task = Task.find(params[:id])
  @task.destroy
  end

  def task_params
  # *Strong params*: You need to *whitelist* what can be updated by the user
  # Never trust user data!
  params.require(:task).permit(:title, :description)
  end
end
