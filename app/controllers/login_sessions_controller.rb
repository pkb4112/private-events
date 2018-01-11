class LoginSessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:loginsession][:email].downcase)
		if user 
			log_in(user)
			flash[:success] = 'You have been successfully logged in'
			redirect_to user_url(user)
		else
			flash.now[:danger] = 'User not found'
			render 'new'
	    end
	end

	def destroy 
		log_out
		flash[:success] = 'Successfully logged out'
		redirect_to root_url
	end
end
