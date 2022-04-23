class EventsController < ApplicationController

  def index
    events = Event.all
    render json: events.as_json
  end

  def show
    event = Event.find(params[:id])
    render json: event.as_json
  end

  def create
    event = Event.new(
      date: params[:date],
      start: params[:start],
      end: params[:end],
      user_id: params[:user_id],
      duration_total: params[:duration_total],
    )
    if event.save
      business_times = BusinessTime.where(date: params[:date], time: params[:start]..params[:end])
      business_times.each do |time|
        time.available = false
        time.event_id = Event.last.id
        time.save
      end
      render json: event.as_json
    else
      business_times.each do |time|
        time.delete
      end
      render json: {errors: event.errors.full_message}
    end
  end

  def update
    event = Event.find(params[:id])
    event.date = params[:date]
    event.start = params[:start]
    event.end = params[:end]
    event.user_id = params[:user_id]
    event.duration_total = params[:duration_total]
    if event.save
      render json: event.as_json
    else
      render json: {errors: event.errors.full_message}
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.delete
      render json: event.as_json
    else
      render json: {errors: event.errors.full_message}
    end
  end

end