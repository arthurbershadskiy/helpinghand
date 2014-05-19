class EventsController < ApplicationController

	def new
		@event = Event.new
	end
	def index
		@events = Event.all
	end
	def show
		@event = Event.find(params[:id])
	end
	def create 
		@event = Event.new(event_params)
		if @event.save
			redirect_to @event
		else
			render '/events/new.html.erb'
		end
 	end
 	def edit
 		@event = Event.find(params[:id])
 	end
 	def update
 		@event = Event.find(params[:id])
 		if @event.update_attributes(event_params)
 			redirect_to @event
 		else
 			render '/events/edit.html.erb'
 		end
 	end
 	def destroy
		@event = Event.find(params[:id])
		if @event.destroy
			redirect_to root_path
			flash[:notice] = "Event deleted"
		else
			flash[:alert] = "Event not deleted"
		end
	end
	def add_user
		@event = Event.find(params[:event_id])
		if @event.users.include? current_user
			redirect_to @event
			flash[:alert] = "You're already signed up for this event."
		else
		@event.users << current_user
		redirect_to @event
		flash[:notice] = "Hope to see you there."
		end
	end


	private
	def event_params
    	params.require(:event).permit(:name, :address, :longitude, :latitude, :user_id)
  	end

end
