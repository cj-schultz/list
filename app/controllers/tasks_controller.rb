class TasksController < ApplicationController
  before_action :require_signin

  def index
    @group = Group.find(params[:group_id])
    @pending_tasks = Task.pending(@group)
    @completed_tasks = Task.complete(@group)
  end

  def show
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
    @task = Task.new
    session[:previous_url] = request.referer
  end

  def create 
    @group = Group.find(params[:group_id])
    @task = @group.tasks.new(task_params)
    @task.complete = false
    if @task.save
      redirect_to session[:previous_url], notice: "Task successfully created"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])
    session[:previous_url] = request.referer
  end

  def update
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to session[:previous_url], notice: "Task successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to group_tasks_path(@group), alert: "Task successfully deleted"
  end

  def complete_single
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:task_id])

    @task.update(complete: true)

    redirect_to request.referer, notice: "#{@task.title} completed"
  end

private
  def task_params
    params.require(:task).permit(:title, :due_date, :description)
  end
end


# TODO: format time to show hours as AM and PM, and just the date if the time is not specified
