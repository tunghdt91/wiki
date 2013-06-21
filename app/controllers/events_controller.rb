class EventsController < ApplicationController
	def index
			@event_new = Event.new
			@all_events= Event.all
	end

	def create
		event = Event.new(params[:event])
		if event.save
			flash[:success]="Complete"
			redirect_to root_path
		else
			flash[:error] = "Error"
			redirect_to events_path
		end
	end
end
