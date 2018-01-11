class EventsController < ApplicationController
	before_action :logged_in_user?, only: [:create, :new, :destroy, :join]


  def index
  	@events = Event.all 
  end

  def new
  	@event = current_user.hosted_events.new
  end

  def create
  	@event = current_user.hosted_events.new(event_params)
  	if @event.save 
  		flash[:success] = 'Event Created Successfully'
  		redirect_to @event
  	else
  		flash.now[:danger] = 'Event Creation Failed'
  		render 'new'
  	end
  end

  def show
  	@event = Event.find(params[:id])
  end

  def join
    @event = Event.find(params[:id])
    @event.guests << current_user
    flash[:sucess] = 'You have joined the event'
    redirect_to @event 
  end

  def destroy
  end

  private

  def event_params
  	params.require(:event).permit(:name, :location, :date)
  end

  def logged_in_user?
  	unless logged_in?
  		flash[:danger] = 'Please Log In First'
  		redirect_to login_url
  	end
  end


end
