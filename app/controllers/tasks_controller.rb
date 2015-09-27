class TasksController < ApplicationController
  before_action :require_signin

  def index
    @group = Group.find(params[:group_id])
    @pending_tasks = @group.tasks.where(complete: false).order(:due_date)
    @completed_tasks = @group.tasks.where(complete: true).order(:due_date)
  end

  def show
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])
  end

  def new
    @group = Group.find(params[:group_id])
    @task = Task.new
  end

  def create 
    @group = Group.find(params[:group_id])
    @task = @group.tasks.new(task_params)
    @task.complete = false
    if @task.save
      redirect_to group_task_path(@group, @task), notice: "Task successfully created"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to group_task_path(@group, @task), notice: "Task successfully updated"
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

  def complete
    @group = Group.find(params[:group_id])
    task_ids = params[:task_ids]
    
    task_ids.each  do |task_id|
      @group.tasks.find(task_id).update(complete: true)
    end

    redirect_to group_tasks_path(@group), notice: "Tasks successfully marked as complete"
  end

private
  def task_params
    params.require(:task).permit(:title, :due_date, :description)
  end
end


# TODO: format time to show hours as AM and PM, and just the date if the time is not specified
