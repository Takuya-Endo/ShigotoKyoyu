class AppointmentsController < ApplicationController
  def show
  end

  def new
    @event = Event.new
    @event.build_appointment
  end

  def create
    @event = Event.new(event_params)
    @event.save
    @appointment = Appointment.find_by(event_id: @event.id)
  end

  def edit
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to new_event_path
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to new_appointment_path
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :appointment_id, :start_date, :end_date, :time_span, appointment_attributes: [:id, :event_id, :destination, :person_in_charge, :contact_means, :nearest_station, :travel_time, :preparation_time, :created_at, :updated_at])
  end

end
