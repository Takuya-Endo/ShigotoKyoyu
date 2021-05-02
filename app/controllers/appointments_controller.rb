class AppointmentsController < ApplicationController
  def show
  end

  def new
    @event = Event.new
    @appointment = Appointment.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
