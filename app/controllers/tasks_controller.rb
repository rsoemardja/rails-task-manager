class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by_id(params[:id])

    if @task.nil?
      redirect_to tasks_url, notice: "Task not found."
    end
  end

  def new
    @task = Task.new
  end

  def create
    require 'rest_client'

    task_params = { title: 'New Task', details: 'Task description' }
    response = RestClient.post 'http://localhost:3000/tasks', task_params, content_type: :json

    if response.code == 200
      redirect_to tasks_url, notice: "Task was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def task_params
      params.require(:task).permit(:title, :details, :completed)
    end
end
