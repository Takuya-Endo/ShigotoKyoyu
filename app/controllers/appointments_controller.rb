class AppointmentsController < ApplicationController
  def show
  end

  def new
    @event = Event.new
    @event.build_appointment
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
