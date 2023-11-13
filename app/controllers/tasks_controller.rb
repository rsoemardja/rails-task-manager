class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])

    if @task.nil?
      redirect_to tasks_url, notice: "Task not found."
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path(@task)
    # task_params = { title: 'New Task', details: 'Task description' }
    # response = RestClient.post 'http://localhost:3000/tasks', task_params, content_type: :json

    # if response.code == 200
    #   redirect_to tasks_url, notice: "Task was successfully created."
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
