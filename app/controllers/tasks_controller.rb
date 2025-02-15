class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all

    render json: @tasks, except: [:created_at, :updated_at]
  end

  # GET /tasks/1
  def show
    render json: @task
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy

    render :json => {message: "Task remove success!"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:list_id, :name, :description)
    end
end
