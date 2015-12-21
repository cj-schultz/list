class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
  def require_signin
    unless current_user
      redirect_to welcome_url
    end
  end

  def gather_month_tasks(month)
    all_tasks = []

    current_user.groups.all.each do |group|
      group_tasks = group.tasks.all
      group_tasks.each do |task|
        if task.due_date.month > month - 1 && task.due_date.month < month + 1
          all_tasks << task
        end
      end
    end

    all_tasks
  end

  def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user, :gather_all_tasks

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

end
