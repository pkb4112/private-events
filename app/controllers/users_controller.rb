class UsersController < ApplicationController


  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in(@user)
  		flash[:sucess] = "Signup Successful - Welcome #{@user.name}"
  		redirect_to @user
  	else
  		flash.now[:danger] = 'Invalid Input - Signup Failed'
  		render 'new'
  	end
  end
  
  def show
  	@user = User.find(params[:id])
  	
  	#Hosted
  	@hosted_events = @user.hosted_events.past
  	#Hosting
  	@hosting_events = @user.hosted_events.future
  	#Attended
    @attended_events = @user.attended_events.past
  	#Attending
  	@attending_events = @user.attended_events.future
  end

  def destroy
  end

  private 

   def user_params 
   	params.require(:user).permit(:email,:name)
   end


end
