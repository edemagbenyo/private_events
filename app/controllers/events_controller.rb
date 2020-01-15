# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :require_login, only: %i[new create]
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(name: params[:event][:name], location: params[:event][:location], event_date: params[:event][:event_date])
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
    @past_events = Event.past
    @future_events = Event.future
  end

  def attendee
    event = Event.find_by(id: params[:event_id])
    event.attendances.create(user_id: current_user.id)
    redirect_to show
  end

  private

  def require_login
    redirect_to root_path unless logged_in?
  end
end
