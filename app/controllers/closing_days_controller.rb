class ClosingDaysController < ApplicationController

  before_action :authenticate_admin

  def index
    dates = ClosingDay.all
    render json: dates.as_json
  end

  def update
    date = ClosingDay.find(params[:id])
    date.date = params[:date] || date.date
    if date.save
      render json: date.as_json
    else
      render json: {error: date.errors.full_message}
    end
  end

  def destroy
    date = ClosingDay.find(params[:id])
    if date.delete
      render json: date.as_json
    else
      render json: {error: date.errors.full_message}
    end
  end
  
end
