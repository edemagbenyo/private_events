class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create 
    @event = Event.new(name: params[:event][:name], location: 'House', event_date: DateTime.now)
    @event.build_user(id: session[:user_id])
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end
  def show
    @event = Event.find_by(id: params[:id])
  end

  def index
    # user_id
    @events = Event.all
    
  end
end
