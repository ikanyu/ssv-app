class Admin::EventsController < ApplicationController
	def index
		@events = Event.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.new(event_params)
		if @event.save
			redirect_to admin_events_path
			flash[:success] = 'Event is created successfully!'
		else
			render :new
			flash[:error] = 'Error! Please fill in selected ones'
		end
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			redirect_to admin_events_path
			flash[:success] = 'Event is updated'
		else
			render :edit
			flash[error] = 'Error! Please fill in selected ones'
		end
	end

	def destroy
		
	end

	private

	def event_params
		params.require(:event).permit(:title, :introduction, :date, :time, :venue, :volunteering_hour, :gathering_time, :gathering_venue, :transportation, :meal, :certificate, :job_scope, :notes)
	end

end