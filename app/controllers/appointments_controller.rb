class AppointmentsController < ApplicationController

  def show
    @appointment = Appointment.find(params[:id])
    @event = Event.find(@appointment.event_id)
  end

  def new
    user = User.find(current_user.id)
    @teams = user.teams

    @event = Event.new
    @event.build_appointment
  end

  def create
    @event = Event.new(event_params)
    @event.save
    @appointment = Appointment.find_by(event_id: @event.id)
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @event = Event.find(@appointment.event_id)
  end

  def update
    appointment = Appointment.find(params[:id])
    event = Event.find(appointment.event_id)
    event.update(update_event_params)
    redirect_to root_path
  end

  def destroy
    appointment = Appointment.find(params[:id])
    event = Event.find(appointment.event_id)
    event.destroy
    redirect_to root_path
  end

  def complete
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :appointment_id, :start_date, :end_date, :time_span, appointment_attributes: [:event_id, :destination, :person_in_charge, :contact_means, :nearest_station, :travel_time, :preparation_time, :created_at, :updated_at])
  end

  def update_event_params
    params.require(:event).permit(:user_id, :appointment_id, :start_date, :end_date, :time_span, appointment_attributes: [:_destroy, :id, :event_id, :destination, :person_in_charge, :contact_means, :nearest_station, :travel_time, :preparation_time, :created_at, :updated_at])
  end

end
