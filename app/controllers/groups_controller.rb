class GroupsController < ApplicationController
  before_action :require_signin
  before_action :set_user_groups

  def index
    @groups = @user_groups
  end

  def show
    @group = @user_groups.find(params[:id])
  end

  def edit
    @group = @user_groups.find(params[:id])
  end

  def update
    @group = @user_groups.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice: "Group successfully updated"
    else
      render :edit
    end
  end

  def new
    @group = @user_groups.new
    session[:previous_url] = request.referer
  end

  def create
    @group = @user_groups.new(group_params)
    if @group.save
      redirect_to group_tasks_path(@group), notice: "Group successfully created"
    else
      render :new
    end
  end

  def destroy
    @group = @user_groups.find(params[:id])
    @group.destroy
    redirect_to groups_url, alert: "Group successfully deleted"
  end

private

  def set_user_groups
    @user_groups = current_user.groups
  end

  def group_params
    params.require(:group).permit(:title)
  end

end
