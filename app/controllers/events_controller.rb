class EventsController < ApplicationController

  def index
    @events = Event.all
    @appointment = Appointment.all
    @meeting = Meeting.all
    @task = Task.all
  end

  def new
  end
end
