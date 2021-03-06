class SessionsController < ApplicationController
	def welcome

	end
	
	def new

	end

	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome back, #{user.name}"
			redirect_to root_url
		else
			flash.now[:alert] = "Invalid email/password combination"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: "Successfully signed out"
	end
end