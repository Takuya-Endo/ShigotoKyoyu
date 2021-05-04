class EventsController < ApplicationController

  def index
    @events = Event.all
    # start_date = params.fetch(:start_date, Date.today).to_date
    # end_date = params.fetch(:end_date, Date.today).to_date
    # @events = Event.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week, end_date: end_date.beginning_of_month.beginning_of_week..end_date.end_of_month.end_of_week)

    # @events = Event.where(end_date: end_date.beginning_of_month.beginning_of_week..end_date.end_of_month.end_of_week)
  end

  def new
  end

end
